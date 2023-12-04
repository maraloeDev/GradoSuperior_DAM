/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package com.eduardomsa.Vistas;

import java.awt.Image;
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
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

/**
 *
 * @author Eduardo Martin-Sonseca
 */
public class GUI_Principal extends javax.swing.JFrame {

    /**
     * Creates new form GUI_Principal
     */
    /* Creo esta variable booleana para poner la contraseña a false,
        para indicar que el usuario no la puede ver*/
    private boolean mostrarContrasena = false;

    static Connection con;
    static final String URL = "jdbc:mysql://localhost:3306/patitofeo";
    static final String USER = "root";
    static final String PASSWORD = "";

    /*En este metodo (GUI_Principal()) contiene los metodos principales del JFrame:
            setFrame(): Contiene los parametros para optimizar la ventana
            comprobaciones(): Hago que se muestre u oculte la contraseña
            setImageLabel(): Establece una imagen de fondo
            widowOpened() : Cuando se abre la ventana, se comprueba la conexion a la BD
            windowClosing(): Cuando se cierra la ventana, se desconecta de la BD
     */
    public GUI_Principal() {
        initComponents();
        setFrame();
        comprobaciones();
        setImageLabel(Fondo, "src\\main\\java\\com\\eduardomsa\\Imagenes\\FondoSesion.png");

        addWindowListener(new WindowAdapter() {
            @Override
            public void windowOpened(WindowEvent e) {
                try {
                    con = DriverManager.getConnection(URL, USER, PASSWORD);
                    //JOptionPane.showMessageDialog(null, "Base de datos conectada");

                    botonLogin.setEnabled(true);
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(null, "BD no conectada. vuelvalo a intentar por favor");
                    dispose();
                }
            }

            @Override
            public void windowClosing(WindowEvent e) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(GUI_Principal.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        });
    }

    /*En este metodo (setImageLabel()) establezco: 
                            Que imagen se va a mostrar en el label
                            La ruta donde esta la imagen que se va a incorporar                                                                             
                            al boton.
     */
    private void setImageLabel(JLabel label, String url) {

        ImageIcon image = new ImageIcon(url);

        Icon icon = new ImageIcon(image.getImage().getScaledInstance(label.getWidth(), label.getHeight(), Image.SCALE_DEFAULT));
        label.setIcon(icon);
    }

    /*En este metodo (setImageButton()) Es lo mismo que el metodo anterior, pero cambio
            el tipo de objeto, en este caso el JButton.
     */
    private void setImageButton(JButton button, String url) {

        ImageIcon image = new ImageIcon(url);

        Icon icon = new ImageIcon(image.getImage().getScaledInstance(button.getWidth(), button.getHeight(), Image.SCALE_DEFAULT));
        button.setIcon(icon);
    }

    /*En este metodo (setFrame()) Establezco el tamaño y el
    comportaminento de la ventana, para que cuando el usuario cierre la 
    aplicación, esta finalice, y tambien para que la posicion de la ventana se 
    estblezca en el medio, y que el usuario no la pueda maximizar.
     */
    private void setFrame() {
        setSize(740, 340);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setResizable(false);
    }

    private void comprobaciones() {
        
        //Establezco la imagen de cerrar ojo con el metodo setImageLabel()
        setImageButton(ocultarMostrarContrasena, "src\\main\\java\\com\\eduardomsa\\Imagenes\\cerrarojo.png");
        ocultarMostrarContrasena.addActionListener((ActionEvent e) -> {
            
            //Aterna la visualizacion de la contraseña.
            mostrarContrasena = !mostrarContrasena;

            /* creo una estructura de seleccion (if-else) y 
            determino que la variable sea distinta a false (es decir ahora
            pasa a verdadero) y, si es verdadero muestro la contraseña y 
            los caracteres clicando en el boton. Cuando se clica, cambia la 
            imagen utilizando el método anterior pero para una imagen diferente.
            */
            if (mostrarContrasena) {
                CajaContraseña.setEchoChar((char) 0); // Mostrar caracteres de contraseña
                setImageButton(ocultarMostrarContrasena, "src\\main\\java\\com\\eduardomsa\\Imagenes\\abrirojo.png");
            } else {
                CajaContraseña.setEchoChar('\u2022'); // Ocultar caracteres de contraseña con puntos
                setImageButton(ocultarMostrarContrasena, "src\\main\\java\\com\\eduardomsa\\Imagenes\\cerrarojo.png");
            }
        });
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        GrupoSeleccion = new javax.swing.ButtonGroup();
        jFrame1 = new javax.swing.JFrame();
        PanelInicioSesion = new javax.swing.JPanel();
        Titulo = new javax.swing.JLabel();
        Contraseña = new javax.swing.JLabel();
        Usuario = new javax.swing.JLabel();
        CajaUsuario = new javax.swing.JTextField();
        CajaContraseña = new javax.swing.JPasswordField();
        botonLogin = new javax.swing.JButton();
        botonSalir = new javax.swing.JButton();
        ocultarMostrarContrasena = new javax.swing.JButton();
        Fondo = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();

        javax.swing.GroupLayout jFrame1Layout = new javax.swing.GroupLayout(jFrame1.getContentPane());
        jFrame1.getContentPane().setLayout(jFrame1Layout);
        jFrame1Layout.setHorizontalGroup(
            jFrame1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 0, Short.MAX_VALUE)
        );
        jFrame1Layout.setVerticalGroup(
            jFrame1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 0, Short.MAX_VALUE)
        );

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("PAGINA PRINCIPAL");

        PanelInicioSesion.setBackground(new java.awt.Color(255, 255, 255));
        PanelInicioSesion.setMaximumSize(new java.awt.Dimension(500, 500));
        PanelInicioSesion.setMinimumSize(new java.awt.Dimension(500, 500));
        PanelInicioSesion.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        Titulo.setBackground(new java.awt.Color(255, 255, 255));
        Titulo.setFont(new java.awt.Font("Segoe Print", 1, 14)); // NOI18N
        Titulo.setForeground(new java.awt.Color(255, 255, 255));
        Titulo.setText("INTRANET GUARDERIA \"ELEFANTE AZUL\"");
        PanelInicioSesion.add(Titulo, new org.netbeans.lib.awtextra.AbsoluteConstraints(210, 40, 320, -1));

        Contraseña.setBackground(new java.awt.Color(255, 255, 255));
        Contraseña.setFont(new java.awt.Font("Segoe Print", 0, 12)); // NOI18N
        Contraseña.setForeground(new java.awt.Color(255, 255, 255));
        Contraseña.setText("CONTRASEÑA");
        PanelInicioSesion.add(Contraseña, new org.netbeans.lib.awtextra.AbsoluteConstraints(250, 140, 100, -1));

        Usuario.setBackground(new java.awt.Color(255, 255, 255));
        Usuario.setFont(new java.awt.Font("Segoe Print", 0, 12)); // NOI18N
        Usuario.setForeground(new java.awt.Color(255, 255, 255));
        Usuario.setText("USUARIO");
        PanelInicioSesion.add(Usuario, new org.netbeans.lib.awtextra.AbsoluteConstraints(250, 70, 80, 30));

        CajaUsuario.setBackground(new java.awt.Color(0, 155, 125));
        CajaUsuario.setFont(new java.awt.Font("Segoe Print", 0, 12)); // NOI18N
        CajaUsuario.setForeground(new java.awt.Color(255, 255, 255));
        CajaUsuario.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        PanelInicioSesion.add(CajaUsuario, new org.netbeans.lib.awtextra.AbsoluteConstraints(250, 100, 150, -1));

        CajaContraseña.setBackground(new java.awt.Color(0, 155, 125));
        CajaContraseña.setFont(new java.awt.Font("Segoe Print", 0, 12)); // NOI18N
        CajaContraseña.setForeground(new java.awt.Color(255, 255, 255));
        CajaContraseña.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        PanelInicioSesion.add(CajaContraseña, new org.netbeans.lib.awtextra.AbsoluteConstraints(250, 170, 150, -1));

        botonLogin.setBackground(new java.awt.Color(77, 107, 79));
        botonLogin.setFont(new java.awt.Font("Segoe Print", 1, 12)); // NOI18N
        botonLogin.setForeground(new java.awt.Color(255, 255, 255));
        botonLogin.setText("ACCEDER");
        botonLogin.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        botonLogin.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                botonLoginActionPerformed(evt);
            }
        });
        PanelInicioSesion.add(botonLogin, new org.netbeans.lib.awtextra.AbsoluteConstraints(250, 210, -1, -1));

        botonSalir.setBackground(new java.awt.Color(77, 107, 79));
        botonSalir.setFont(new java.awt.Font("Segoe Print", 1, 12)); // NOI18N
        botonSalir.setForeground(new java.awt.Color(255, 255, 255));
        botonSalir.setText("SALIR");
        botonSalir.setToolTipText("");
        botonSalir.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        botonSalir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                botonSalirActionPerformed(evt);
            }
        });
        PanelInicioSesion.add(botonSalir, new org.netbeans.lib.awtextra.AbsoluteConstraints(370, 210, -1, -1));

        ocultarMostrarContrasena.setBackground(new java.awt.Color(0, 155, 125));
        ocultarMostrarContrasena.setForeground(new java.awt.Color(255, 255, 255));
        PanelInicioSesion.add(ocultarMostrarContrasena, new org.netbeans.lib.awtextra.AbsoluteConstraints(410, 170, 60, 30));

        Fondo.setBackground(new java.awt.Color(255, 255, 255));
        PanelInicioSesion.add(Fondo, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 730, 300));

        jPanel1.setBackground(new java.awt.Color(0, 204, 102));

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 730, Short.MAX_VALUE)
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );

        PanelInicioSesion.add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 730, 300));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(PanelInicioSesion, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(PanelInicioSesion, javax.swing.GroupLayout.PREFERRED_SIZE, 300, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents


    private void botonLoginActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_botonLoginActionPerformed
       /* Si la base de datos no esta conectada al "servidor" saltara un 
            mensaje automaticamente por seguridad. */
       
        if (con == null) {
            JOptionPane.showMessageDialog(null, "Fallo de conexión: Base de datos no está conectada");
            System.exit(0);
        }

        String usuario = CajaUsuario.getText();
        String contrasena = String.valueOf(CajaContraseña.getPassword());

        /* Creo un objeto Statement, el cual avisa al objeto 'con'
            "Voy a ejecutar una consulta", despues añado un objeto ResultSet,
            ejecutando la consulta del Statment en que se selecciona el usuario 
            y la contraeña, donde el login sea igual a la casilla del usuario. */
        
        try (Statement st = con.createStatement()) {
            // Hacemos un INNER JOIN para sacar el ID del niño
            ResultSet rs = st.executeQuery("SELECT c.login, c.password, n.id_niño"
                    + " FROM cuentas c , niños n"
                    + " WHERE c.familia = n.familia AND login like '" + usuario + "'");
            
 /* Recorro con un puntero las columnas de "login y password"*/
            if (rs.next()) {
                String log = rs.getString("c.login");
                String passBd = rs.getString("c.password");
                // El ID del niño lo utilizaremos en futuras consultas durante la sesión
                int idNino = rs.getInt("n.id_niño");

                // Comprobamos la contraseña
                if (passBd.equals(contrasena)) {
                    new Opciones_Familia1(idNino).setVisible(true);
                    
                    dispose();
                } else {
                    JOptionPane.showMessageDialog(null, "Contraseña incorrecta");
                }
            } else {
                JOptionPane.showMessageDialog(null, "Usuario no encontrado");
            }
/* Una vez acabado la sesión, se cierran los objetos ResultSet, y Statement
            para liberar espacio en memoria. */
            rs.close();
            st.close();
        } catch (SQLException ex) {
Logger.getLogger(Opciones_Familia1.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    }//GEN-LAST:event_botonLoginActionPerformed

    private void botonSalirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_botonSalirActionPerformed
        dispose();
    }//GEN-LAST:event_botonSalirActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {

        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(GUI_Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(() -> {
            new GUI_Principal().setVisible(true);
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPasswordField CajaContraseña;
    private javax.swing.JTextField CajaUsuario;
    private javax.swing.JLabel Contraseña;
    private javax.swing.JLabel Fondo;
    private javax.swing.ButtonGroup GrupoSeleccion;
    private javax.swing.JPanel PanelInicioSesion;
    private javax.swing.JLabel Titulo;
    private javax.swing.JLabel Usuario;
    private javax.swing.JButton botonLogin;
    private javax.swing.JButton botonSalir;
    private javax.swing.JFrame jFrame1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JButton ocultarMostrarContrasena;
    // End of variables declaration//GEN-END:variables

}
