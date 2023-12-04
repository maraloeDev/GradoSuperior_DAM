/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package com.eduardomsa.Vistas;

import java.awt.event.ActionEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;
import javax.swing.DefaultListModel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.ListSelectionModel;

/**
 *
 * @author Eduardo Martin-Sonseca
 */
public class Resumen_Familia1 extends javax.swing.JFrame {

    // Variables de conexión a la base de datos
    static Connection con;
    static final String URL = "jdbc:mysql://localhost:3306/patitofeo";
    static final String USER = "root";
    static final String PASSWORD = "";
    
    

// Componentes de la interfaz de usuario
    /* Creo un JList, para mostrar las destripciones y tipos de datos sacados
               de la base de datos, y por si acaso se actualiza en algun momento
                la base de datos, utilizo JScrollPane para mostrar un contenido
                futuro, y que se pueda desplazar hacia abajo o hacia los lados
                sin tener que modificar la posicion y el tamaño de la lista*/
    private JList listaResumen;
    private JScrollPane scrollResumenComida = new JScrollPane();
    private JScrollPane scrollResumenDeposiciones = new JScrollPane();
    private JScrollPane scrollResumenDescanso = new JScrollPane();
    private JScrollPane scrollResumenObservaciones = new JScrollPane();
    private JTextArea areaAutorizaciones = new JTextArea();
    private JButton guardarAutorizacion = new JButton("Guardar");
    
    private ArrayList<Integer> oIdItem;   
    private ArrayList<Integer> oTipo;
    private ArrayList<String> oDescripcion;
    private Integer oIdNino;
    private String oFechaActividad;
    private Integer idAutorizacion;

    /**
     * Creates new form Resumen_Familia1
     */
    
    public Resumen_Familia1(ArrayList<Integer> idItem, ArrayList<Integer> tipo, ArrayList<String> descripcion, Integer idNino, String fechaActividad) {
        oIdItem=idItem;
        oTipo=tipo;
        oDescripcion = descripcion;
        oIdNino=idNino;
        oFechaActividad = fechaActividad;
        initComponents();
        setLocationRelativeTo(null);
        
        // Cargo para los elementos de la interfaz de usuario
        ImageIcon iconoComida = new ImageIcon("src\\main\\java\\com\\eduardomsa\\Imagenes\\Comida.png");
        ImageIcon iconoDeposiciones = new ImageIcon("src\\main\\java\\com\\eduardomsa\\Imagenes\\Deposiciones.png");
        ImageIcon iconoDescanso = new ImageIcon("src\\main\\java\\com\\eduardomsa\\Imagenes\\Descanso.png");
        ImageIcon iconoObservaciones = new ImageIcon("src\\main\\java\\com\\eduardomsa\\Imagenes\\Observaciones.png");
        ImageIcon iconoAutorizaciones = new ImageIcon("src\\main\\java\\com\\eduardomsa\\Imagenes\\Autorizaciones.png");
        // Establezco los iconos para los elementos de la interfaz de usuario
        this.imgComida.setIcon(iconoComida);
        this.imgDeposiciones.setIcon(iconoDeposiciones);
        this.imgDescanso.setIcon(iconoDescanso);
        this.imgObservaciones.setIcon(iconoObservaciones);
        this.imgAutorizaciones.setIcon(iconoAutorizaciones);

        addWindowListener(new WindowAdapter() {
            @Override
            public void windowOpened(WindowEvent e) {
                try {
                    //Este objeto se utiliza para conecctarse con la base de datos.
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
        
    
        
        // Añado las comidas
        listaResumen = new JList<>(new DefaultListModel<>());
        listaResumen.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        
        DefaultListModel<String> listModel = new DefaultListModel<>();
        
        /* Cargo los datos en la lista que se va a visualizar,
        por cada vuelta de bucle cargo la lista de cada tipo*/
        for (int i=0; i<oIdItem.size(); i++){
            if ( oTipo.get(i) == 1 ) listModel.addElement(oDescripcion.get(i));
        }
        
        /* Creo la listaDatos para añadirla, con un modo de seleccion que solo
            se seleccione uno,, añado a la lista un scroll (por si en versiones
            futuras se añaden mas datos), establezco tamaño y posicion,
            y lo hago visible*/
        listaResumen.setModel(listModel);
        scrollResumenComida = new JScrollPane(listaResumen);
        scrollResumenComida.setBounds(200, 30, 260, 50);
        scrollResumenComida.setVisible(false);
        add(scrollResumenComida);
        
        // Añado las deposiciones
        listaResumen = new JList<>(new DefaultListModel<>());
        listaResumen.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

        listModel = new DefaultListModel<>();
        
/* Cargo los datos en la lista que se va a visualizar,
        por cada vuelta de bucle cargo la lista de cada tipo*/

        for (int i=0; i<oIdItem.size(); i++){
            if ( oTipo.get(i) == 2 ) listModel.addElement(oDescripcion.get(i));
        }
        
        /* Creo la listaDatos para añadirla, con un modo de seleccion que solo
            se seleccione uno,, añado a la lista un scroll (por si en versiones
            futuras se añaden mas datos), establezco tamaño y posicion,
            y lo hago visible*/
        
        listaResumen.setModel(listModel);
        scrollResumenDeposiciones = new JScrollPane();
        scrollResumenDeposiciones = new JScrollPane(listaResumen);
        scrollResumenDeposiciones.setBounds(220, 130, 260, 50);
        scrollResumenDeposiciones.setVisible(false);
        add(scrollResumenDeposiciones);
        
        // Añado los descansos
        listaResumen = new JList<>(new DefaultListModel<>());
        listaResumen.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

        listModel = new DefaultListModel<>();
        
        /* Cargo los datos en la lista que se va a visualizar,
        por cada vuelta de bucle cargo la lista de cada tipo*/

        for (int i=0; i<oIdItem.size(); i++){
            if ( oTipo.get(i) == 3 ) listModel.addElement(oDescripcion.get(i));
        }
        
        /* Creo la listaDatos para añadirla, con un modo de seleccion que solo
            se seleccione uno,, añado a la lista un scroll (por si en versiones
            futuras se añaden mas datos), establezco tamaño y posicion,
            y lo hago visible*/
        listaResumen.setModel(listModel);
        scrollResumenDescanso = new JScrollPane();
        scrollResumenDescanso = new JScrollPane(listaResumen);
        scrollResumenDescanso.setBounds(200, 230, 260, 50);
        scrollResumenDescanso.setVisible(false);
        add(scrollResumenDescanso);
        
        // Añado las observaciones
        listaResumen = new JList<>(new DefaultListModel<>());
        listaResumen.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

        listModel = new DefaultListModel<>();
        
        /* Cargo los datos en la lista que se va a visualizar,
        por cada vuelta de bucle cargo la lista de cada tipo*/

        for (int i=0; i<oIdItem.size(); i++){
            if ( oTipo.get(i) == 4 ) listModel.addElement(oDescripcion.get(i));
        }
        
        /* Creo la listaDatos para añadirla, con un modo de seleccion que solo
            se seleccione uno,, añado a la lista un scroll (por si en versiones
            futuras se añaden mas datos), establezco tamaño y posicion,
            y lo hago visible*/
        listaResumen.setModel(listModel);
        scrollResumenObservaciones = new JScrollPane();
        scrollResumenObservaciones = new JScrollPane(listaResumen);
        scrollResumenObservaciones.setBounds(240, 320, 260, 50);
        add(scrollResumenObservaciones);
        scrollResumenObservaciones.setVisible(false);
        
        // Añado las autorizaciones
        idAutorizacion=0;
        areaAutorizaciones = new JTextArea();
        areaAutorizaciones.setBounds(250, 430, 260, 50);
        areaAutorizaciones.setEditable(true);
        areaAutorizaciones.setVisible(false);
        
        /* Cargo los datos en la lista que se va a visualizar,
        por cada vuelta de bucle cargo la lista de cada tipo*/
        
        for (int i=0; i<oIdItem.size(); i++){
            if ( oTipo.get(i) == 5 ) {
                areaAutorizaciones.append(oDescripcion.get(i));
                // Necesitamos el ID del item para saber la fila que hay que actualizar
                // Si no hay autorizacion, se queda en 0 para saber que hay que insertar la fila
                idAutorizacion=oIdItem.get(i);
                break;
            }
        }
        add(areaAutorizaciones);
        // Botón Guardar para las autorizaciones
        // Añade el ActionListener al botón Guardar
        guardarAutorizacion.addActionListener((ActionEvent e) -> {
            // El campo de actualizaciones tiene que tener algún contenido
            if ( ! areaAutorizaciones.getText().isEmpty() ) {
                // Comprueba si hay que insertar o actualizar una autorizacion
                if ( idAutorizacion==0 ) {
                    try {
                        // Query de insercción de datos
                        Statement insertAutorizacion = con.createStatement();
                        insertAutorizacion.executeUpdate("INSERT INTO items(fecha,tipo,descripcion,id_niño) VALUES( "
                                + "'" + oFechaActividad + "', "
                                + "5, "
                                + "'" + areaAutorizaciones.getText() + "', "
                                + oIdNino + ")");
                        
                        // Consulta para actualizar el ID, en el caso de que haya que actualizar la fila
                        Statement stAutoridad = con.createStatement();
                        ResultSet rs = stAutoridad.executeQuery("SELECT id_item "
                                + "FROM items "
                                + "WHERE fecha='" + oFechaActividad + "' "
                                        + "AND tipo=5 "
                                        + "AND id_niño=" + oIdNino);
                        rs.next(); //Avanza a la siguiente 
                        idAutorizacion = rs.getInt(1);
                    } catch (SQLException ex) {
                        Logger.getLogger(Opciones_Familia1.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else {
                    try {
                        /* Creo una consulta que actualiza la casilla, si esta
                            vacio se le notificara al usuario*/
                        
                        Statement updateAutorizacion = con.createStatement();
                        updateAutorizacion.executeUpdate("UPDATE items "
                                + "SET descripcion='" + areaAutorizaciones.getText() + "' "
                                + "WHERE id_item=" + idAutorizacion);
                        JOptionPane.showMessageDialog(null, "Datos almacenados correctamente");
                    } catch (SQLException ex) {
                        Logger.getLogger(Opciones_Familia1.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            } else JOptionPane.showMessageDialog(null, "El area de texto está vacío");
        });
       guardarAutorizacion.setBounds(385, 485, 125, 30);
        guardarAutorizacion.setVisible(false);
        
        add(guardarAutorizacion);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        GrupoResumen = new javax.swing.ButtonGroup();
        radioComida = new javax.swing.JRadioButton();
        radioDeposiciones = new javax.swing.JRadioButton();
        radioDescanso = new javax.swing.JRadioButton();
        radioObservaciones = new javax.swing.JRadioButton();
        radioAutorizaciones = new javax.swing.JRadioButton();
        botonAtras = new javax.swing.JButton();
        imgComida = new javax.swing.JLabel();
        imgDeposiciones = new javax.swing.JLabel();
        imgDescanso = new javax.swing.JLabel();
        imgObservaciones = new javax.swing.JLabel();
        imgAutorizaciones = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setResizable(false);

        GrupoResumen.add(radioComida);
        radioComida.setText("COMIDA");
        radioComida.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                radioComidaMousePressed(evt);
            }
        });

        GrupoResumen.add(radioDeposiciones);
        radioDeposiciones.setText("DEPOSICIONES");
        radioDeposiciones.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                radioDeposicionesMousePressed(evt);
            }
        });

        GrupoResumen.add(radioDescanso);
        radioDescanso.setText("DESCANSO");
        radioDescanso.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                radioDescansoMousePressed(evt);
            }
        });

        GrupoResumen.add(radioObservaciones);
        radioObservaciones.setText("OBSERVACIONES");
        radioObservaciones.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                radioObservacionesMousePressed(evt);
            }
        });

        GrupoResumen.add(radioAutorizaciones);
        radioAutorizaciones.setText("AUTORIZACIONES");
        radioAutorizaciones.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                radioAutorizacionesMousePressed(evt);
            }
        });

        botonAtras.setText("<- ATRAS");
        botonAtras.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                botonAtrasActionPerformed(evt);
            }
        });

        imgComida.setBackground(new java.awt.Color(204, 153, 255));
        imgComida.setForeground(new java.awt.Color(255, 153, 153));
        imgComida.setMaximumSize(new java.awt.Dimension(73, 67));
        imgComida.setMinimumSize(new java.awt.Dimension(73, 67));
        imgComida.setPreferredSize(new java.awt.Dimension(73, 67));

        imgDeposiciones.setBackground(new java.awt.Color(204, 153, 255));
        imgDeposiciones.setForeground(new java.awt.Color(255, 153, 153));
        imgDeposiciones.setMaximumSize(new java.awt.Dimension(73, 67));
        imgDeposiciones.setMinimumSize(new java.awt.Dimension(73, 67));
        imgDeposiciones.setPreferredSize(new java.awt.Dimension(73, 67));

        imgDescanso.setBackground(new java.awt.Color(204, 153, 255));
        imgDescanso.setForeground(new java.awt.Color(255, 153, 153));
        imgDescanso.setMaximumSize(new java.awt.Dimension(73, 67));
        imgDescanso.setMinimumSize(new java.awt.Dimension(73, 67));
        imgDescanso.setPreferredSize(new java.awt.Dimension(73, 67));

        imgObservaciones.setBackground(new java.awt.Color(204, 153, 255));
        imgObservaciones.setForeground(new java.awt.Color(255, 153, 153));
        imgObservaciones.setMaximumSize(new java.awt.Dimension(73, 67));
        imgObservaciones.setMinimumSize(new java.awt.Dimension(73, 67));
        imgObservaciones.setPreferredSize(new java.awt.Dimension(73, 67));

        imgAutorizaciones.setBackground(new java.awt.Color(204, 153, 255));
        imgAutorizaciones.setForeground(new java.awt.Color(255, 153, 153));
        imgAutorizaciones.setMaximumSize(new java.awt.Dimension(73, 67));
        imgAutorizaciones.setMinimumSize(new java.awt.Dimension(73, 67));
        imgAutorizaciones.setPreferredSize(new java.awt.Dimension(73, 67));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(botonAtras)
                        .addGap(410, 410, 410))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(imgAutorizaciones, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGap(16, 16, 16)
                        .addComponent(radioAutorizaciones)
                        .addGap(431, 431, 431))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(imgDeposiciones, javax.swing.GroupLayout.PREFERRED_SIZE, 85, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED, 22, Short.MAX_VALUE))
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(layout.createSequentialGroup()
                                        .addComponent(imgComida, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGap(0, 0, Short.MAX_VALUE))
                                    .addComponent(imgObservaciones, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(imgDescanso, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                                .addGap(4, 4, 4)))
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(radioComida)
                            .addComponent(radioDeposiciones)
                            .addComponent(radioDescanso)
                            .addComponent(radioObservaciones))
                        .addGap(429, 429, 429))))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(49, 49, 49)
                        .addComponent(radioComida))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(28, 28, 28)
                        .addComponent(imgComida, javax.swing.GroupLayout.PREFERRED_SIZE, 62, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(41, 41, 41)
                        .addComponent(imgDeposiciones, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(61, 61, 61)
                        .addComponent(radioDeposiciones)))
                .addGap(39, 39, 39)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(imgDescanso, javax.swing.GroupLayout.PREFERRED_SIZE, 73, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(38, 38, 38)
                        .addComponent(imgObservaciones, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 14, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(21, 21, 21)
                        .addComponent(radioDescanso)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(radioObservaciones)
                        .addGap(38, 38, 38)))
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(19, 19, 19)
                        .addComponent(imgAutorizaciones, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(radioAutorizaciones)
                        .addGap(42, 42, 42)))
                .addComponent(botonAtras)
                .addGap(27, 27, 27))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void botonAtrasActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_botonAtrasActionPerformed

        new Opciones_Familia1(oIdNino).setVisible(true);
        this.dispose();

    }//GEN-LAST:event_botonAtrasActionPerformed

    /* Cuando se pulsa en un radioButton desaparece el que no esta seleccionado*/
    private void radioComidaMousePressed(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_radioComidaMousePressed
        scrollResumenComida.setVisible(true);
        scrollResumenDeposiciones.setVisible(false);
        scrollResumenDescanso.setVisible(false);
        scrollResumenObservaciones.setVisible(false);
        areaAutorizaciones.setVisible(false);
        guardarAutorizacion.setVisible(false);
    }//GEN-LAST:event_radioComidaMousePressed

    private void radioDeposicionesMousePressed(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_radioDeposicionesMousePressed
        scrollResumenComida.setVisible(false);
        scrollResumenDeposiciones.setVisible(true);
        scrollResumenDescanso.setVisible(false);
        scrollResumenObservaciones.setVisible(false);
        areaAutorizaciones.setVisible(false);
        guardarAutorizacion.setVisible(false);
    }//GEN-LAST:event_radioDeposicionesMousePressed

    private void radioDescansoMousePressed(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_radioDescansoMousePressed
        scrollResumenComida.setVisible(false);
        scrollResumenDeposiciones.setVisible(false);
        scrollResumenDescanso.setVisible(true);
        scrollResumenObservaciones.setVisible(false);
        areaAutorizaciones.setVisible(false);
        guardarAutorizacion.setVisible(false);
    }//GEN-LAST:event_radioDescansoMousePressed

    private void radioObservacionesMousePressed(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_radioObservacionesMousePressed
        scrollResumenComida.setVisible(false);
        scrollResumenDeposiciones.setVisible(false);
        scrollResumenDescanso.setVisible(false);
        areaAutorizaciones.setVisible(false);        
        guardarAutorizacion.setVisible(false);
        scrollResumenObservaciones.setVisible(true);
    }//GEN-LAST:event_radioObservacionesMousePressed

    private void radioAutorizacionesMousePressed(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_radioAutorizacionesMousePressed
         scrollResumenComida.setVisible(false);
        scrollResumenDeposiciones.setVisible(false);
        scrollResumenDescanso.setVisible(false);
        scrollResumenObservaciones.setVisible(false);
        areaAutorizaciones.setVisible(true);
        guardarAutorizacion.setVisible(true);
    }//GEN-LAST:event_radioAutorizacionesMousePressed

    /**
     * @param args the command line arguments
     */
//    public static void main(String args[]) {
//        /* Set the Nimbus look and feel */
//        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
//        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
//         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
//         */
//        try {
//            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
//                if ("Nimbus".equals(info.getName())) {
//                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
//                    break;
//                }
//            }
//        } catch (ClassNotFoundException ex) {
//            java.util.logging.Logger.getLogger(ResumenDia2.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (InstantiationException ex) {
//            java.util.logging.Logger.getLogger(ResumenDia2.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (IllegalAccessException ex) {
//            java.util.logging.Logger.getLogger(ResumenDia2.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
//            java.util.logging.Logger.getLogger(ResumenDia2.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        }
//        //</editor-fold>
//        //</editor-fold>
//
//        /* Create and display the form */
//        java.awt.EventQueue.invokeLater(new Runnable() {
//            public void run() {
//                new ResumenDia2().setVisible(true);
//            }
//        });
//    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.ButtonGroup GrupoResumen;
    private javax.swing.JButton botonAtras;
    private javax.swing.JLabel imgAutorizaciones;
    private javax.swing.JLabel imgComida;
    private javax.swing.JLabel imgDeposiciones;
    private javax.swing.JLabel imgDescanso;
    private javax.swing.JLabel imgObservaciones;
    private javax.swing.JRadioButton radioAutorizaciones;
    private javax.swing.JRadioButton radioComida;
    private javax.swing.JRadioButton radioDeposiciones;
    private javax.swing.JRadioButton radioDescanso;
    private javax.swing.JRadioButton radioObservaciones;
    // End of variables declaration//GEN-END:variables
}
