/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package com.gf.vistas;

import com.gf.controles.ControlJuego1;
import javax.swing.JFrame;
import javax.swing.JPanel;
import java.awt.FlowLayout;
import java.awt.BorderLayout;
import java.awt.Font;
import java.awt.Color;
import javax.swing.Timer;
import javax.swing.JOptionPane;
import javax.swing.JLabel;
import javax.swing.SwingConstants;
import javax.swing.BorderFactory;

/**
 *
 * @author Eduardo Martín-Sonseca Mario Ortuñez
 *
 * Clase del primer juego
 *
 * Enunciado: 1. ¿Quién lo hizo? A partir de unas imágenes de obras de arte
 * genéricas, hay que adivinar su autor
 *
 */
public class GUI_Juego1 extends JFrame {

    private final JPanel panelContenedor = new JPanel(new BorderLayout());
    private JPanel panelDatos;
    private JPanel panelCuadros;
    private JPanel panelBoton;
    private JPanel panelContador;

    private ControlJuego1 juego1 = new ControlJuego1();

    private int tiempoContador = 360;
    private Timer timer;

    private JLabel labelContador;

    public GUI_Juego1() {
        initComponents();
        setFrame();
        try {
            panelCuadros = juego1.rellenarPanelCuadros();
            panelDatos = juego1.rellenarPanelDatos();
            panelBoton = juego1.rellenarPanelBoton();
            panelContador = juego1.rellenarPanelContador();

            panelContador.setLayout(new FlowLayout(FlowLayout.CENTER));
            labelContador = new JLabel("", SwingConstants.CENTER);
            labelContador.setFont(new Font("Arial", Font.BOLD, 50));
            labelContador.setForeground(Color.RED);
            labelContador.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));
            panelContador.add(labelContador);

            iniciarContador();
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Algo falló en el juego: ¿Quién lo hizo?");
        }
    }

   

    private void setFrame() {
        setTitle("¿Quién lo hizo?");
        setLocationRelativeTo(null);
        setContentPane(panelContenedor);

        panelContenedor.add(panelCuadros, BorderLayout.CENTER);
        panelContenedor.add(panelDatos, BorderLayout.EAST);
        panelContenedor.add(panelBoton, BorderLayout.SOUTH);
        panelContenedor.add(panelContador, BorderLayout.WEST);

        pack();
    }

    private void iniciarContador() {
        timer = new Timer(1000, e -> {
            tiempoContador--;
            actualizarContador();

            if (tiempoContador <= 0) {
                timer.stop();
                // Realizar acciones cuando el tiempo se agota
            }
        });
        timer.start();
    }

    private void actualizarContador() {
        int minutos = tiempoContador / 60;
        int segundos = tiempoContador % 60;

        String tiempo = String.format("%02d:%02d", minutos, segundos);
        labelContador.setText(tiempo);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

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
            java.util.logging.Logger.getLogger(GUI_Juego1.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(() -> {
            new GUI_Juego1().setVisible(true);
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables
}
