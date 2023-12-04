/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package com.gf.app.parque.view;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.FlowLayout;
import static java.awt.Frame.MAXIMIZED_BOTH;
import java.awt.GridLayout;
import java.awt.Toolkit;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.SwingConstants;

/**
 * GUIRegistro: es la ventana que permite al usuario registrarse en la
 * aplicacion. No es un registro al uso ya que tienes que estar dado de alta en
 * la base de datos para poder modificar tu contrasenia. Aparece una caja de
 * texto para dni, otras 2 para contrasenia (introducir y confirmar) y los
 * botones aceptar y cancelar.
 *
 * @author priparno
 */
public class GUIRegistro extends javax.swing.JFrame {

    /**
     * tamPantalla: el tamanio de la pantalla.
     */
    private Dimension tamPantalla = Toolkit.getDefaultToolkit().getScreenSize();

    /**
     * panelBotones: es el panel donde se colocan los botones.
     */
    private JPanel panelBotones;
    /**
     * panelTextFields: es el panel donde se colocan las cajas de texto.
     */
    private JPanel panelTextFields;

    /**
     * textFdni: es la caja de texto donde introducir el dni.
     */
    private JTextField textFdni;
    /**
     * textFPassword: es la caja de texto donde introducir la contrasenia.
     */
    private JPasswordField textFPassword;
    /**
     * confirmPassword: es la caja de texto donde introducir la confirmacion de
     * contrasenia.
     */
    private JPasswordField confirmPassword;

    /**
     * cancelarBut: es el boton de cancelar.
     */
    private JButton cancelarBut;
    /**
     * aceptarBut: es el boton de aceptar.
     */
    private JButton aceptarBut;

    /**
     * Creates new form GUIRegistro
     */
    public GUIRegistro() {
        initComponents();
        setFrame();
    }

    /**
     * setFrame: es el metodo principal que ajusta y coloca componentes por
     * pantalla
     */
    private void setFrame() {
        this.setTitle("Acceder");
        this.setSize(tamPantalla);
        this.setExtendedState(MAXIMIZED_BOTH);
        this.getContentPane().setLayout(new GridLayout(2, 1));
        setTextFields();
        setButtons();
    }

    /**
     * setTextFields: coloca y crea las cajas de texto en la ventana.
     */
    private void setTextFields() {
        //va un poco mejor pero no me acaba de convencer
        textFdni = new JTextField();
        textFPassword = new JPasswordField();
        confirmPassword = new JPasswordField();
        textFdni.setPreferredSize(new Dimension(200, 25));
        textFPassword.setPreferredSize(new Dimension(200, 25));
        confirmPassword.setPreferredSize(new Dimension(200, 25));
        panelTextFields = new JPanel(new BorderLayout());
        GridLayout gl = new GridLayout(3, 2, 5, 20);
        JPanel panelExtra = new JPanel(gl);
        JLabel nombre = new JLabel("DNI: ");
        nombre.setHorizontalAlignment(SwingConstants.RIGHT);
        panelExtra.add(nombre);
        JPanel panelTF1 = new JPanel(new FlowLayout(FlowLayout.LEFT));
        panelTF1.add(textFdni);
        panelExtra.add(panelTF1);
        JLabel contra1 = new JLabel("Contraseña: ");
        contra1.setHorizontalAlignment(SwingConstants.RIGHT);
        panelExtra.add(contra1);
        JPanel panelTF2 = new JPanel(new FlowLayout(FlowLayout.LEFT));
        panelTF2.add(textFPassword);
        panelExtra.add(panelTF2);
        JLabel contra2 = new JLabel("Repite la contraseña: ");
        contra2.setHorizontalAlignment(SwingConstants.RIGHT);
        panelExtra.add(contra2);
        JPanel panelTF3 = new JPanel(new FlowLayout(FlowLayout.LEFT));
        panelTF3.add(confirmPassword);
        panelExtra.add(panelTF3);
        panelTextFields.add(panelExtra, BorderLayout.SOUTH);
        this.getContentPane().add(panelTextFields);
    }

    /**
     * setButtons: coloca y crea los botones en la ventana.
     */
    private void setButtons() {
        cancelarBut = new JButton("Cancelar");
        aceptarBut = new JButton("Aceptar");
        panelBotones = new JPanel(new FlowLayout(FlowLayout.CENTER, 50, 50));
        this.getContentPane().add(panelBotones);
        panelBotones.add(aceptarBut);
        panelBotones.add(cancelarBut);
    }

    /**
     * getTextFdni: devuelve un JTextField que es donde se introducira el dni
     *
     * @see JTextField
     *
     * @return un JTextField
     */
    public JTextField getTextFdni() {
        return textFdni;
    }

    /**
     * getTextFPassword: devuelve un JPasswordField que es donde se introducira
     * la contrasenia.
     *
     * @see JPasswordField
     *
     * @return un JPasswordField
     */
    public JPasswordField getTextFPassword() {
        return textFPassword;
    }

    /**
     * getConfirmPassword: devuelve un JPasswordField que es donde se
     * introducira la confirmacion de la contrasenia.
     *
     * @see JPasswordField
     *
     * @return un JPasswordField
     */
    public JPasswordField getConfirmPassword() {
        return confirmPassword;
    }

    /**
     * getCancelarBut: devuelve un JButton que sera el boton de cancelar.
     *
     * @see JButton
     *
     * @return un JButton
     */
    public JButton getCancelarBut() {
        return cancelarBut;
    }

    /**
     * getAceptarBut: devuelve un JButton que sera el boton de aceptar.
     *
     * @see JButton
     *
     * @return un JButton
     */
    public JButton getAceptarBut() {
        return aceptarBut;
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

    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables
}
