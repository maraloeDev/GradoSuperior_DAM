/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gf.app.parque.controller;

import com.gf.app.parque.resources.ConexionBD;
import com.gf.app.parque.view.GUIInicio;
import com.gf.app.parque.view.GUILogin;
import com.gf.app.parque.view.GUIRegistro;
import java.awt.event.ActionListener;
import javax.swing.JButton;

/**
 * InicioController: es el controlador de inicio. Permite al usuario escoger si
 * entrar o registrarse. Al ser una aplicacion para administradores, este
 * registro no esta permitido para cualquier usuario. Para poder registrarse, el
 * dni de usuario ya debe estar aniadido a la base de datos.
 *
 * @author priparno
 */
public class InicioController {

    /**
     * vista: la vista del controlador.
     */
    private GUIInicio vista;

    /**
     * InicioController: constuctor del controlador. Recoge la vista pasada por
     * parametro, prueba la conexion y aniade los escuchadores.
     *
     * @param vista la vista del controlador
     */
    public InicioController(GUIInicio vista) {
        this.vista = vista;
        tryConn();
        setActionListener();
    }

    /**
     * al: es el escuchador de los botones de entrar y registrar.
     */
    private ActionListener al = (e) -> {
        JButton opt = (JButton) (e.getSource());
        if (opt.equals(vista.getOptButtons().get(0))) {
            vista.dispose();
            LoginController lc = new LoginController(new GUILogin(), vista);
        } else if (opt.equals(vista.getOptButtons().get(1))) {
            vista.setVisible(false);
            RegistroController rc = new RegistroController(new GUIRegistro(), vista);
        } else {
            System.err.println("Error");
        }
    };

    /**
     * setActionListener: aniade el escuchador de accion a los botones.
     */
    private void setActionListener() {
        for (JButton opt : vista.getOptButtons()) {
            opt.addActionListener(al);
        }
    }

    /**
     * tryConn: prueba la conexion, si no es valida cierra el programa.
     */
    private void tryConn() {
        if (!ConexionBD.isValid()) {
            System.exit(0);
        }
    }

    /**
     * launch: pone visible la ventana.
     */
    public void launch() {
        vista.setVisible(true);
    }

}
