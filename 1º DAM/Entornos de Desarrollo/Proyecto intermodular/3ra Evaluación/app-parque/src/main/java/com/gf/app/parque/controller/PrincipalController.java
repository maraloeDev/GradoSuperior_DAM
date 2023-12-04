/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gf.app.parque.controller;

import com.gf.app.parque.view.GUIPrincipal;
import com.gf.app.parque.view.GUIReserva;
import java.awt.event.ActionListener;
import javax.swing.JButton;

/**
 * PrincipalController: es el controlador de la vista principal/menu. En este se
 * muestra todas las opciones de la aplicacion.
 * <ul>
 * <li>Version 1.0: boton reserva unicamente.s</li>
 * </ul>
 *
 * @author priparno
 */
public class PrincipalController {

    /**
     * vista: la vista del controlador.
     */
    private GUIPrincipal vista;

    /**
     * al: es el escuchador de los botones del menu.
     */
    private ActionListener al = (e) -> {
        if (((JButton) e.getSource()).equals(vista.getBotonReserva())) {
            GUIReserva gr = new GUIReserva();
            ReservaController rs = new ReservaController(vista, gr);
        }
    };

    /**
     * PrincipalController: es el constructor del controlador. Recibe como
     * parametro la vista que lanzara. Aniade tambien los escuchadores de los
     * componentes.
     *
     * @param vista la vista del controlador
     */
    public PrincipalController(GUIPrincipal vista) {
        this.vista = vista;
        addActionListener();
        launchView();
    }

    /**
     * addActionListener: aniade los escuchadores a los componentes de la
     * ventana.
     */
    private void addActionListener() {
        vista.getBotonReserva().addActionListener(al);
    }

    /**
     * launchView: lanza la vista del controlador (la pone visible).
     */
    private void launchView() {
        vista.setVisible(true);
    }
}
