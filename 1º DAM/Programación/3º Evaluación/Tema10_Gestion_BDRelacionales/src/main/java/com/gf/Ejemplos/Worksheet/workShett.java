/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package com.gf.Ejemplos.Worksheet;

import java.awt.Dimension;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author maraloed
 */
public class workShett extends javax.swing.JFrame {

    private DefaultTableModel modeloTabla;
    private String[] NombreColumnas = {"idPersona", "Nombre", "Apellidos", "Edad"};
    private static Connection con;
    private static String url = "jdbc:mysql://localhost:3306/prueba";
    private static String user = "root";
    private static String passwd = "";

    /**
     * Creates new form workShett
     */
    public workShett() {
        initComponents();
        setFrame();
    }

    private void setFrame() {
        this.setLocationRelativeTo(null);
        this.setPreferredSize(new Dimension(500, 300));
        modeloTabla = new DefaultTableModel(null, NombreColumnas);
        this.jTable1.setModel(modeloTabla);

    }

    public static Connection conectarBD() {

        try {
            con = DriverManager.getConnection(url, user, passwd);
            System.out.println("CONEXION REALIZADA ");
        } catch (SQLException ex) {
            System.out.println("ERROR DE CONEXION" + ex.getMessage());
        }
        return con;
    }

    public static void desconectarBD() {
        try {
            if (con != null) {
                con.close();
            }
            System.out.println("DESCONEXION REALIZADA ");
        } catch (SQLException ex) {
            System.out.println("Error al desconectar...");

        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        PanelResultados = new javax.swing.JPanel();
        panelSQL = new javax.swing.JPanel();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTextArea1 = new javax.swing.JTextArea();
        jButton1 = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Ejemplo Prepare Statement");

        PanelResultados.setLayout(new java.awt.BorderLayout());

        panelSQL.setLayout(new javax.swing.BoxLayout(panelSQL, javax.swing.BoxLayout.LINE_AXIS));

        jTextArea1.setColumns(20);
        jTextArea1.setRows(5);
        jScrollPane2.setViewportView(jTextArea1);

        panelSQL.add(jScrollPane2);

        jButton1.setText("Run");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        panelSQL.add(jButton1);

        PanelResultados.add(panelSQL, java.awt.BorderLayout.PAGE_START);

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane1.setViewportView(jTable1);

        PanelResultados.add(jScrollPane1, java.awt.BorderLayout.CENTER);

        getContentPane().add(PanelResultados, java.awt.BorderLayout.CENTER);

        jMenu1.setText("Parametros");
        jMenuBar1.add(jMenu1);

        setJMenuBar(jMenuBar1);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        if (jTextArea1.getText().isEmpty()) {

            JOptionPane.showMessageDialog(null, "No has intriducido nada");
        } else {
            try ( Connection con = conectarBD()) {
                PreparedStatement ps = con.prepareCall(this.jTextArea1.getText());
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int id = rs.getInt("idPersona");
                    String nombre = rs.getString("Nombre");
                    String apellidos = rs.getString("Apellidos");
                    int edad = rs.getInt("Edad");
                    modeloTabla.addRow(new String[]{String.valueOf(id),nombre, apellidos, String.valueOf(edad)});
                }

            } catch (SQLException ex) {
                Logger.getLogger(workShett.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                desconectarBD();
            }
        }
    }//GEN-LAST:event_jButton1ActionPerformed

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
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(workShett.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(workShett.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(workShett.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(workShett.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new workShett().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel PanelResultados;
    private javax.swing.JButton jButton1;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextArea jTextArea1;
    private javax.swing.JPanel panelSQL;
    // End of variables declaration//GEN-END:variables

}
