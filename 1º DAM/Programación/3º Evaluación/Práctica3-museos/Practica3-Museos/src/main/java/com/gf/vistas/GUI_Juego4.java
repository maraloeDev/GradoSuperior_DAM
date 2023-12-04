/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package com.gf.vistas;

import com.gf.controles.Juego4;
import com.gf.dao.Dao;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.SwingConstants;
import javax.swing.Timer;

/**
 *
 * @author Eduardo Martín-Sonseca y Mario Ortuñez
 */
public class GUI_Juego4 extends javax.swing.JFrame {

    private final JPanel panelContenedor = new JPanel(new GridLayout(2, 2));
    private static final JPanel panelMapamundi = new JPanel(new GridLayout(2, 0));
    private static final JPanel panelCuadros = new JPanel(new GridLayout(0, 2));
    private static final JPanel panelBoton = new JPanel(new FlowLayout());
    private static final JPanel panelContador = new JPanel(new FlowLayout());

    private static Juego4 juego4;
    private static final Dao dao = new Dao();

    private int tiempoContador = 360;
    private Timer timer;

    public GUI_Juego4() {
        try {
            initComponents();
            setFrame();
            int n = (int) (Math.random() * 10);
            juego4 = new Juego4(dao, dao.getObras().get(n), dao.getObras().get(n), dao.getObras().get(n), dao.getObras().get(n));
            rellenarCuadros();
        } catch (MalformedURLException ex) {
            Logger.getLogger(GUI_Juego4.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void setFrame() {
        this.setTitle("Juego 4");
        this.setLocationRelativeTo(null);
        this.setContentPane(panelContenedor);
        panelContenedor.add(panelCuadros);
    }

    public static void rellenarMapamundi() {
        JLabel mapaMundi = new JLabel();
        ImageIcon icono = new ImageIcon("recursos/Mapa del mundo.png");
        Image imagen = icono.getImage().getScaledInstance(200, 200, Image.SCALE_SMOOTH);
        mapaMundi.setIcon(new ImageIcon(imagen));
        panelMapamundi.add(mapaMundi);
    }

    public static void rellenarCuadros() throws MalformedURLException {
        List<String> listaURLS = juego4.urlImg();
        List<String> listaNombres = juego4.nombreObras();

        int numeroCuadros = Math.min(listaURLS.size(), listaNombres.size());

        for (int i = 0; i < numeroCuadros; i++) {
            JLabel cuadro = new JLabel();
            JLabel nombre = new JLabel(listaNombres.get(i));
            try {
                URL imagenUrl = new URL(listaURLS.get(i));
                ImageIcon icono = new ImageIcon(imagenUrl);
                Image imagen = icono.getImage().getScaledInstance(200, 200, Image.SCALE_SMOOTH);
                cuadro.setIcon(new ImageIcon(imagen));
            } catch (MalformedURLException e) {
                throw e;
            }

            cuadro.addMouseMotionListener(new MouseAdapter() {
                @Override
                public void mouseDragged(MouseEvent e) {
                    nombre.setLocation(e.getX() + cuadro.getX() - cuadro.getWidth() / 2,
                            e.getY() + cuadro.getY() - cuadro.getHeight() / 2);
                }
            });

            nombre.setHorizontalAlignment(SwingConstants.CENTER);

            panelCuadros.add(cuadro);
            panelCuadros.add(nombre);
        }
    }

    public void rellenarPanelBoton() {
        JButton botonOk = new JButton("OK");
        botonOk.addActionListener((ActionEvent e) -> {
            int contadorCuadro = 1;
            for (int i = 0; i <= (panelCuadros.getComponents().length - 1); i = i + 2) {

                JLabel cuadro = (JLabel) panelCuadros.getComponents()[i];
                JLabel mapaMundi = (JLabel) panelMapamundi.getComponent(0);
                if (mapaMundi.getBounds().contains(cuadro.getLocation())) {
                    JOptionPane.showMessageDialog(null, "El cuadros " + panelCuadros.getComponents()[i + 1] + " no fue colocado");
                    contadorCuadro++;
                }
            }
        });
        panelBoton.add(botonOk);

        botonOk.setHorizontalAlignment(SwingConstants.CENTER);
    }

    public void rellenarPanelContador() {
        JLabel contador = new JLabel();
        ActionListener actionListener = (ActionEvent event) -> {
            tiempoContador--;
            contador.setName(tiempoContador + " s");

            if (tiempoContador <= 0) {
                timer.stop();
                JOptionPane.showMessageDialog(null, "Se acabó el tiempo");
            }
        };

        timer = new Timer(1000, actionListener);
        timer.start();

        panelContador.add(contador);
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
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(GUI_Juego4.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        java.awt.EventQueue.invokeLater(() -> {
            new GUI_Juego4().setVisible(true);
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables
}
