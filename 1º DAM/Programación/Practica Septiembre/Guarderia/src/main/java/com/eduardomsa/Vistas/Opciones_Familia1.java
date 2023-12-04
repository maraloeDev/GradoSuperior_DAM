/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package com.eduardomsa.Vistas;

import com.toedter.calendar.JCalendar;
import java.awt.Color;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;
import javax.swing.BorderFactory;
import javax.swing.ButtonGroup;
import javax.swing.DefaultListModel;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.ListSelectionModel;
import javax.swing.border.Border;
import javax.swing.border.EtchedBorder;

/**
 *
 * @author Eduardo Martin-Sonseca
 */
public class Opciones_Familia1 extends javax.swing.JFrame {

    static Connection con;
    static final String URL = "jdbc:mysql://localhost:3306/patitofeo";
    static final String USER = "root";
    static final String PASSWORD = "";

    /*En esta clase he decicido hacerla por codigo, y estos son los botones 
     */
    private JRadioButton radioPerfil;
    private JRadioButton radioCalendario;
    private ButtonGroup grupoBotones;
    private JLabel fotoNinio;
    private JButton botonSiguiente;
    private JButton botonAtras;
    private JList<String> listaDatos;
    private JScrollPane scrollLista;
    private JCalendar calendario;
    private Integer oIdNino;

    /*En este metodo (OpcionesFamilia1()) contiene los metodos principales del JFrame:
            setFrame(): Contiene los parametros para optimizar la ventana
            componentes(): Añado toods los componentes que se van 
                a asignar a la ventana
            comprobaciones(): Añado el textArea con los datos sacados de la BD
            widowOpened(): Cuando se abre la ventana, se comprueba la conexion a la BD
            windowClosing(): Cuando se cierra la ventana, se desconecta de la BD
     */
    public Opciones_Familia1(int idNino) {
        /*  Necesito el id, para identificar que perfil estoy viendo (el 1 o el 2)*/
        oIdNino=idNino;
        initComponents();
        setFrame();
        componentes();
        componentesAcciones();
        comprobaciones();
        if (oIdNino==1){
            setImageLabel(fotoNinio, "src\\main\\java\\com\\eduardomsa\\Imagenes\\FotoNiño.png");
        } else if(oIdNino==2){
            setImageLabel(fotoNinio, "src\\main\\java\\com\\eduardomsa\\Imagenes\\FotoNiña.png");
        }

        addWindowListener(new WindowAdapter() {
            @Override
            public void windowOpened(WindowEvent e) {
                try {
                    con = DriverManager.getConnection(URL, USER, PASSWORD);

                } catch (SQLException ex) {
                    try {
                        con.close();
                    } catch (SQLException ex1) {
                        JOptionPane.showMessageDialog(null, "BD no conectada. vuelvalo a intentar por favor");
                        dispose();
                    }
                }
            }

            @Override
            public void windowClosing(WindowEvent e) {
                try {
                    con.close();
                } catch (SQLException ex) {

                }
            }
        });

    }

    /*En este metodo (setImageLabel()) Establezco una imagen al JLabel (en este caso
            la ruta de la imagen), despues establezco el ancho, y el alto de la
            imagen para que se adapte al recuadro del JLabel y por ultimo esta-
            blezco la imagen dentro del label.
     */
    private void setImageLabel(JLabel label, String url) {

        ImageIcon image = new ImageIcon(url);

        Icon icon = new ImageIcon(image.getImage().getScaledInstance(label.getWidth(), label.getHeight(), Image.SCALE_DEFAULT));
        label.setIcon(icon);
    }

    /*En este metodo (setFrame()) Establezco el titulo de la ventana,
            la posicion y el tamaño de la ventana, el color de fondo,
            que el usuario no lo pueda maximizar, y lo coloco al centro de la pantalla
     */
    private void setFrame() {
        setTitle("PANEL DE OPCIONES");
        setBounds(500, 700, 750, 480);
        getContentPane().setBackground(new Color(242, 230, 232));
        setResizable(false);
        setLocationRelativeTo(null);
    }

    
    private void componentes() {
        
/*Grupo de botones, (para que se seleccione solamente
        uno), los 2 botones, con su posicion y tamaño respectivo)*/

        grupoBotones = new ButtonGroup();
        radioPerfil = new JRadioButton("Perfil del niño");
        radioPerfil.setBounds(200, 150, 150, 18);
        radioPerfil.setBackground(new Color(242, 230, 232));
        getContentPane().add(radioPerfil);

        radioCalendario = new JRadioButton("Calendario");
        radioCalendario.setBounds(400, 150, 97, 18);
        radioCalendario.setBackground(new Color(242, 230, 232));
        getContentPane().add(radioCalendario);
        grupoBotones.add(radioPerfil);
        grupoBotones.add(radioCalendario);
        
/* Creo un JLabel que contendra la imagen del niño, 
        establezco el tamaño, posicion y borde y lo agrego al panel*/
        fotoNinio = new JLabel();
        fotoNinio.setBounds(300, 10, 100, 100);
        Border etchedLowered = BorderFactory.createEtchedBorder(EtchedBorder.LOWERED);
        Border line = BorderFactory.createLineBorder(Color.BLACK, 2);
        fotoNinio.setBorder(etchedLowered);
        fotoNinio.setBorder(line);
        add(fotoNinio);

        // Incorporo el calendario a mostrar 
        calendario = new JCalendar();
        calendario.setBounds(400, 200, 340, 180);
        calendario.setBorder(line);
        getContentPane().add(calendario);
        
        /* Creo la listaDatos para añadirla, con un modo de seleccion que solo
            se seleccione uno,, añado a la lista un scroll (por si en versiones
            futuras se añaden mas datos), establezco tamaño y posicion,
            y lo hago visible*/
        listaDatos = new JList<>(new DefaultListModel<>());
        listaDatos.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        scrollLista = new JScrollPane(listaDatos);
        scrollLista.setBounds(1, 200, 350, 180);
        add(scrollLista);
        scrollLista.setVisible(false);

        /*establezco los dos botones (Anterior y Siguiente), con posicion y tamaño,
        cuando se de al boton Atras, volvera a la ventana anterior.*/
        botonAtras = new JButton();
        botonAtras.setText("<- Salir");
        botonAtras.setBounds(1, 400, 100, 20);
        add(botonAtras);

        botonSiguiente = new JButton();
        botonSiguiente.setText("Siguiente ->");
        botonSiguiente.setBounds(650, 400, 100, 20);
        add(botonSiguiente);
    }

    /*En este metodo (componentesAcciones()) establezco las acciones que va a
        realizar cada componente
     */
    private void componentesAcciones() {

        botonSiguiente.addActionListener((ActionEvent e) -> {
            resumenDelDia(); /* Llama al metodo resumenDia que contiene los datos
                            de si la fecha se ha introducido correctamente */
        });
        botonAtras.addActionListener((ActionEvent e) -> {
            JOptionPane.showMessageDialog(null, "Has salido");
            dispose();
            new GUI_Principal().setVisible(true);
        });
        
    }
    
    private void comprobaciones() {
        
         /*establezco el calendario a false, para que
        no se vea cuando inicio aparece la ventana.*/
        calendario.setVisible(false);
        botonSiguiente.setVisible(false);
        
/*creo un ActionListener que cuando se clique apareceran los datos del niño, 
        creo un modelo de lista y vacio la lista antes de pulsar el boton para evitar errores*/
        radioPerfil.addActionListener((ActionEvent e) -> {
            scrollLista.setVisible(true);
            calendario.setVisible(false);
            botonSiguiente.setVisible(false);

            try {
                
                /*Creo un objeto Statement, el que avisa al objeto 'con'
            "Voy a ejecutar una consulta", despues creas un objeto ResultSet,
            ejecutando la consulta del Statment en que se seleccionan todos los
        campos de la tabla familias y niños con un alias.*/
                DefaultListModel<String> listModel = (DefaultListModel<String>) listaDatos.getModel();
                listModel.clear();
                Statement st = con.createStatement();
                // Se hace un INNER JOIN para sacar los datos de la familia del niño
                ResultSet rs = st.executeQuery("SELECT f.id_familia, n.familia, f.padre, f.madre, f.direccion, f.tf1, f.tf2, f.email, n.nombre,n.fecha_nac "
                        + " FROM familias f, niños n "
                        + " WHERE f.id_familia=n.familia AND id_niño=" + oIdNino);
                
               /* Escojo la estructura de iteraccion while para recorrer
            cada fila de la tabla cuentas y en cada iteraccion añado al modelo
            de la lista los elementos correspondientes.*/
                while (rs.next()) {
                    listModel.addElement("Padre: " + rs.getString("f.padre") + ".");
                    listModel.addElement("Madre: " + rs.getString("f.madre") + ".");
                    listModel.addElement("Direccion: " + rs.getString("f.direccion") + ".");
                    listModel.addElement("Telefono 1: " + rs.getString("f.tf1") + ".");
                    listModel.addElement("Telefono 2: " + rs.getString("f.tf2") + ".");
                    listModel.addElement("Nombre del niño: " + rs.getString("n.nombre") + ".");
                    listModel.addElement("Fecha de nacimiento: " + rs.getString("n.fecha_nac") + ".");
                    listModel.addElement("Email: " + rs.getString("f.email") + ".");
                }

                /*Una vez acabado la sesión, se cierran los objetos ResultSet, y Statement
            para liberar espacio en memoria.*/
                st.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(Opciones_Familia1.class.getName()).log(Level.SEVERE, null, ex);
            }
        });

        radioCalendario.addActionListener((ActionEvent e) -> {

            scrollLista.setVisible(false);
            calendario.setVisible(true);
            botonSiguiente.setVisible(true);
        });
    }
    
    private void resumenDelDia() {
        try {
            /*Hago un formateo de fecha para la fecha 
        que se introduce en la base de datos.*/
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String fechaActividades = sdf.format(calendario.getDate()); 
            
            Statement stExists = con.createStatement();
            
            /*Creo el ResultSet para contar
                todas el numero de filas que hay en la fecha seleccionada.*/
            ResultSet exists = stExists.executeQuery("SELECT COUNT(*) "
                    + "FROM items "
                    + "WHERE fecha = '" + fechaActividades +"' AND id_niño=1");
            
            try (Statement st = con.createStatement()) {
                
                /* Esta consulta extrae los datos para pasarlos a Resumen_Familia1*/
                ResultSet rs = st.executeQuery("SELECT id_item,fecha,tipo,descripcion,id_niño "
                        + "FROM items "
                        + "WHERE fecha = '" + fechaActividades +"' AND id_niño=1");
                
                /*Para guardar el id, tipo y descripcion de cada item creo ArrayList por
        cada fila. en cada extraccion de datos, guardo cada valor en el arrayList*/
                if ( exists.next() && exists.getInt(1)>0 ) {
                    
                    ArrayList<Integer> idItem = new ArrayList<>();
                    ArrayList<Integer> tipo = new ArrayList<>();
                    ArrayList<String> descripcion = new ArrayList<>();
                    
                    Integer idNino = 0; // El idNiio, le doy un valer inicial
                    /* Creo un bucle de iteraccion while se envia los datos
                        extraídos de la query y también la fecha seleccionada,
                        por si hiciera falta actualizar la autorización*/
                    
                    while (rs.next()) {
                        idItem.add(rs.getInt("id_item"));
                        tipo.add(rs.getInt("tipo"));
                        descripcion.add(rs.getString("descripcion"));
                        idNino = rs.getInt("id_niño");
                    }
                    
                    new Resumen_Familia1(idItem,tipo,descripcion,idNino,fechaActividades).setVisible(true);
                    dispose();
                } else {
                    JOptionPane.showMessageDialog(null, "Sin información en la base de datos");
                }
                
                rs.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(Opciones_Familia1.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setAutoRequestFocus(false);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 400, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    /**
     * @param args the command line arguments
     */
//    public static void main(String args[]) {
//        /* Set the Nimbus look and feel */
//        <editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
//        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
//         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
//         */
//        try {
//            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
//                if ("Nimbus".equals(info.getName())) {
//                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
//                    break;
//
//                }
//            }
//        } catch (ClassNotFoundException ex) {
//            java.util.logging.Logger.getLogger(OpcionesFamilia2.class
//                    .getName()).log(java.util.logging.Level.SEVERE, null, ex);
//
//        } catch (InstantiationException ex) {
//            java.util.logging.Logger.getLogger(OpcionesFamilia2.class
//                    .getName()).log(java.util.logging.Level.SEVERE, null, ex);
//
//        } catch (IllegalAccessException ex) {
//            java.util.logging.Logger.getLogger(OpcionesFamilia2.class
//                    .getName()).log(java.util.logging.Level.SEVERE, null, ex);
//
//        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
//            java.util.logging.Logger.getLogger(OpcionesFamilia2.class
//                    .getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        }
//        </editor-fold>
//        </editor-fold>
//
//        /* Create and display the form */
//        java.awt.EventQueue.invokeLater(() -> {
//            new OpcionesFamilia1().setVisible(true);
//        });
//    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables
}
