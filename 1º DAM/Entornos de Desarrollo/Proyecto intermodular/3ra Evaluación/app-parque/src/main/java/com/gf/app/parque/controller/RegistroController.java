/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gf.app.parque.controller;

import com.gf.app.parque.entities.Administrador;
import com.gf.app.parque.logic.AdministradorLogic;
import com.gf.app.parque.resources.Colors;
import com.gf.app.parque.resources.Validaciones;
import com.gf.app.parque.view.GUIInicio;
import com.gf.app.parque.view.GUIPrincipal;
import com.gf.app.parque.view.GUIRegistro;
import java.awt.Color;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.sql.SQLException;
import javax.swing.JButton;
import javax.swing.JOptionPane;

/**
 * RegistroController: es el controlador de la vista de registro de contrasenia.
 * En el se muestran 3 cajas de texto. La primera es para el dni, la segunda la
 * contrasenia y la tercera para la confirmacion de la misma. Si todos los
 * campos son validos, el trabajador esta en la base de datos y no tiene
 * contrasenia se da por valido y actualiza el campo contrasenia.
 *
 * @author priparno
 */
public class RegistroController {

    /**
     * vistaPadre: es la vista que le ha llamado. Se pone visible al cancelar la
     * operacion.
     */
    private GUIInicio vistaPadre;

    /**
     * vista: es la vista del controlador.
     */
    private GUIRegistro vista;

    /**
     * adminLogic: es la logica de negocio que se va a implementar dependiendo
     * de los inputs del usuario en la ventana.
     */
    private AdministradorLogic adminLogic;

    /**
     * dni: es el dni introducido.
     */
    private String dni;
    /**
     * password: es la contrasenia introducida.
     */
    private String password;
    /**
     * passwordB: es la confirmacion de contrasenia introducida.
     */
    private String passwordB;

    /**
     * errorMsg: codigo del mensaje de error que saltara.
     */
    private int errorMsg;

    /**
     * al: el escuchador de accion de los botones aceptar y cancelar.
     */
    private ActionListener al = (e) -> {
        JButton but = (JButton) e.getSource();
        if (but.equals(vista.getCancelarBut())) {
            vista.dispose();
            vistaPadre.setVisible(true);
        } else {
            dni = vista.getTextFdni().getText();
            password = "";
            char[] passwordChar = vista.getTextFPassword().getPassword();
            for (char c : passwordChar) {
                password += c;
            }
            passwordB = "";
            for (char c : vista.getConfirmPassword().getPassword()) {
                passwordB += c;
            }
            try {
                if (comprobarDatos()) {
                    vista.dispose();
                    GUIPrincipal principal = new GUIPrincipal();
                    PrincipalController pc = new PrincipalController(principal);
                } else {
                    showMessage();
                }
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(vista, "Error de sintaxis.", "ERROR", JOptionPane.ERROR_MESSAGE);
            }
        }

    };

    /**
     * ka1: al dar al enter se pone automaticamente a escribir en la casilla de
     * contrasenia desde la casilla del dni.
     */
    private KeyAdapter ka1 = new KeyAdapter() {
        @Override
        public void keyPressed(KeyEvent e) {
            if (e.getKeyCode() == KeyEvent.VK_ENTER) {
                vista.getTextFPassword().requestFocus();
            }
        }

    };

    /**
     * ka2: al dar al enter se pone automaticamente a escribir en la casilla de
     * confirmar contrasenia desde la casilla de la contrasenia.
     */
    private KeyAdapter ka2 = new KeyAdapter() {
        @Override
        public void keyPressed(KeyEvent e) {
            if (e.getKeyCode() == KeyEvent.VK_ENTER) {
                vista.getConfirmPassword().requestFocus();
            }
        }
    };

    /**
     * ka3: al dar al enter da al boton de aceptar automaticamente desde la
     * casilla de confirmar contrasenia.
     */
    private KeyAdapter ka3 = new KeyAdapter() {
        @Override
        public void keyPressed(KeyEvent e) {
            if (e.getKeyCode() == KeyEvent.VK_ENTER) {
                vista.getAceptarBut().doClick();
            }
        }
    };

    /**
     * comprobarDatos: comprueba los datos de los inputs.
     *
     * @return true -> si los datos son correctos, false -> si son datos
     * incorrectos
     * @throws SQLException si no consigue acceder a la base de datos (error
     * sintactico o base de datos no encontrada)
     */
    private boolean comprobarDatos() throws SQLException {
        if (Validaciones.validateDni(dni)) {
            Administrador admin = adminLogic.selectDni(dni);
            if (admin != null) {
                if (admin.getPassword_admin().isEmpty()) {
                    if (password.equals(passwordB)) {
                        if (password.length() > 8) {
                            return adminLogic.update(dni, password);
                        } else {
                            errorMsg = 5;
                        }
                    } else {
                        errorMsg = 4;
                    }
                } else {
                    errorMsg = 3;
                }
            } else {
                errorMsg = 2;
            }
        } else {
            errorMsg = 1;
        }
        return false;
    }

    /**
     * RegistroController: constructor del controlador. Recibe por parametro la
     * vista del controlador y la vista que lo ha llamado (mediante el
     * controlador de la misma).
     *
     * @param vista la vista del controlador
     * @param parent la vista padre
     */
    public RegistroController(GUIRegistro vista, GUIInicio parent) {
        this.vistaPadre = parent;
        this.vista = vista;
        this.adminLogic = new AdministradorLogic();
        addActionListener();
        launchView();
    }

    /**
     * addActionListener: aniade los escuchadores a los componentes de la
     * ventana.
     */
    private void addActionListener() {
        vista.getAceptarBut().addActionListener(al);
        vista.getCancelarBut().addActionListener(al);
        vista.getTextFdni().addKeyListener(ka1);
        vista.getTextFPassword().addKeyListener(ka2);
        vista.getConfirmPassword().addKeyListener(ka3);
    }

    /**
     * showMessage: muestra un error dependiendo del codigo almacenado en
     * {@link #errorMsg}
     */
    private void showMessage() {
        setWhite();
        switch (errorMsg) {
            case 1 -> {
                JOptionPane.showMessageDialog(vista, "Error. Formato de dni inválido. Debe tener 8 números y 1 letra.", "ERROR", JOptionPane.ERROR_MESSAGE);
                vista.getTextFdni().setBackground(Colors.RED_BACKGROUND);
            }
            case 2 -> {
                JOptionPane.showMessageDialog(vista, "Error. No se ha encontrado el usuario.", "ERROR", JOptionPane.ERROR_MESSAGE);
                vista.getTextFdni().setBackground(Colors.RED_BACKGROUND);
            }
            case 3 -> {
                JOptionPane.showMessageDialog(vista, "Error. El administrador ya tiene una contraseña asociada.", "ERROR", JOptionPane.ERROR_MESSAGE);
                vista.getTextFPassword().setBackground(Colors.RED_BACKGROUND);
            }
            case 4 -> {
                JOptionPane.showMessageDialog(vista, "Error. Las contraseñas no coinciden.", "ERROR", JOptionPane.ERROR_MESSAGE);
                vista.getTextFPassword().setBackground(Colors.RED_BACKGROUND);
                vista.getConfirmPassword().setBackground(Colors.RED_BACKGROUND);
            }
            case 5 -> {
                JOptionPane.showMessageDialog(vista, "Error. Las contraseñas no cumplen el formato de seguridad (8 caracteres).", "ERROR", JOptionPane.ERROR_MESSAGE);
                vista.getTextFPassword().setBackground(Colors.RED_BACKGROUND);
                vista.getConfirmPassword().setBackground(Colors.RED_BACKGROUND);
            }
            default ->
                throw new AssertionError();
        }
    }

    /**
     * setWhite: actualiza todos los componentes a blanco.
     */
    private void setWhite() {
        vista.getTextFdni().setBackground(Color.white);
        vista.getTextFPassword().setBackground(Color.white);
        vista.getConfirmPassword().setBackground(Color.white);
    }

    /**
     * launchView: lanza la vista del controlador (la pone visible).
     */
    private void launchView() {
        vista.setVisible(true);
    }
}
