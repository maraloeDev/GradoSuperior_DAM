/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gf.app.parque.controller;

import com.gf.app.parque.entities.Evento;
import com.gf.app.parque.entities.Menu;
import com.gf.app.parque.logic.EventoLogic;
import com.gf.app.parque.logic.MenuLogic;
import com.gf.app.parque.resources.Colors;
import com.gf.app.parque.resources.Validaciones;
import com.gf.app.parque.view.GUIPrincipal;
import com.gf.app.parque.view.GUIReserva;
import java.awt.Color;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import java.time.ZoneId;
import java.util.Date;
import javax.swing.JButton;
import javax.swing.JOptionPane;

/**
 * ReservaController: es el controlador para reservar un evento. En el se
 * muestran los campos nombre, fecha, numero de participantes, menu, sala y es
 * cumple para rellenarlos con los datos necesarios. Comprueba los campos y si
 * son validos lo aniade a la base de datos.
 *
 * @author priparno
 */
public class ReservaController {

    /**
     * vistaPadre: es la vista que le ha llamado. Se pone visible al cancelar la
     * operacion.
     */
    private GUIPrincipal vistaPadre;

    /**
     * vista: es la vista del controlador.
     */
    private GUIReserva vista;

    /**
     * NOMBRES_SALAS: es un array que contiene las salas del centro.
     */
    private final static String[] NOMBRES_SALAS = {"No seleccionado", "1. Sala dragones", "2. Sala jungla", "3. Sala deportes", "4. Sala fortnite"};

    /**
     * mLogic: es la logica de negocio que se va a implementar dependiendo de
     * los inputs del usuario en la ventana.
     */
    private MenuLogic mLogic = new MenuLogic();
    /**
     * eLogic: es la logica de negocio que se va a implementar dependiendo de
     * los inputs del usuario en la ventana.
     */
    private EventoLogic eLogic = new EventoLogic();

    /**
     * evento: el evento con el que se van a realizar las operaciones.
     */
    private Evento evento;

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
            if (validateInputs()) {
                getContentInputFields();
                try {
                    if (!eLogic.insert(evento)) {
                        JOptionPane.showMessageDialog(vista, "Error al insertar.", "ERROR", JOptionPane.ERROR_MESSAGE);
                    } else {
                        JOptionPane.showMessageDialog(vista, "Insertado.", "ERROR", JOptionPane.ERROR_MESSAGE);
                    }
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(vista, "Error de sintaxis.", "ERROR", JOptionPane.ERROR_MESSAGE);
                }
            } else {
                showMessage();
            }
        }
    };

    /**
     * ReservaController: constructor del controlador. Recibe por parametro la
     * vista del controlador y la vista que lo ha llamado (mediante el
     * controlador de la misma). Tambien da valor a los componentes de la
     * ventana. 
     *
     * @param vistaPadre la vista que lo ha llamado
     * @param vista la vista del controlador
     */
    public ReservaController(GUIPrincipal vistaPadre, GUIReserva vista) {
        this.vistaPadre = vistaPadre;
        this.vista = vista;
        addActionListenerButton();
        setInfoMenu();
        setInfoSalas();
        launchView();
    }

    /**
     * validateInputs: es un metodo que valida los inputs del usuario en la
     * ventana de reserva.
     *
     * @see GUIReserva
     *
     * @return true -> si es valido, false -> si no lo es
     */
    private boolean validateInputs() {
        if (!Validaciones.validateName(vista.getNombreEvento().getText())) {
            errorMsg = 1;
            return false;
        }
        if (vista.getModelo().getValue() == null) {
            errorMsg = 2;
            return false;
        }
        if (vista.getModelo().getValue().before(new Date(System.currentTimeMillis()))) {
            errorMsg = 3;
            return false;
        }
        if (vista.getNumeroParticipantes().getText().isEmpty()) {
            errorMsg = 4;
            return false;
        } else {
            int num;
            try {
                num = Integer.parseInt(vista.getNumeroParticipantes().getText());
                if (num <= 0) {
                    errorMsg = 5;
                    return false;
                }
            } catch (NumberFormatException ex) {
                errorMsg = 6;
                return false;
            }
        }
        return true;
    }

    /**
     * getContentInputFields: actualiza los valores del evento a nivel de clase
     * con los inputs de la ventana.
     */
    private void getContentInputFields() {
        evento = new Evento();
        String nombre = vista.getNombreEvento().getText();
        Date fecha = vista.getModelo().getValue();
        int numParticipantes = Integer.parseInt(vista.getNumeroParticipantes().getText());
        Integer idMenu = getSelectedMenu();
        Integer numSala = getSelectedSala();
        boolean esCumple = vista.getCheckIsCumple().isSelected();
        evento.setNombre_evento(nombre);
        evento.setFecha_evento(fecha.toInstant().atZone(ZoneId.systemDefault()).toLocalDate());
        evento.setNumero_participantes(numParticipantes);
        evento.setId_menu(idMenu);
        evento.setNumero_sala(numSala);
        evento.setEs_cumple(esCumple);
    }

    /**
     * getSelectedMenu: devuelve el menu seleccionado.
     *
     * @return un entero que representa el identificador del menu
     */
    private Integer getSelectedMenu() {
        Integer numero = null;
        if (vista.getOpcionesMenu().getSelectedIndex() != 0) {
            Menu menu = (Menu) vista.getOpcionesMenu().getSelectedItem();
            numero = menu.getId_menu();
        }
        return numero;
    }

    /**
     * getSelectedSala: devuelve la sala seleccionada.
     *
     * @return un entero que representa la sala seleccionada
     */
    private Integer getSelectedSala() {
        Integer numero = null;
        if (vista.getOpcionesSala().getSelectedIndex() != 0) {
            String selected = (String) vista.getOpcionesSala().getSelectedItem();
            String[] partes = selected.split("\\.");
            numero = Integer.valueOf(partes[0]);
        }
        return numero;
    }

    /**
     * setInfoMenu: da el valor al desplegable del menu.
     */
    private void setInfoMenu() {
        Menu noSeleccionado = new Menu();
        noSeleccionado.setNombre_menu("No seleccionado");
        this.vista.getOpcionesMenu().addItem(noSeleccionado);
        try {
            for (Menu menu : mLogic.select()) {
                this.vista.getOpcionesMenu().addItem(menu);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(vista, "Error de sintaxis", "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    /**
     * setInfoSalas: da los valores al desplegable de las salas.
     */
    private void setInfoSalas() {
        for (String string : NOMBRES_SALAS) {
            this.vista.getOpcionesSala().addItem(string);
        }
    }

    /**
     * addActionListenerButton: aniade los escuchadores a los componentes de la
     * ventana.
     */
    private void addActionListenerButton() {
        vista.getCancelarBut().addActionListener(al);
        vista.getAceptarBut().addActionListener(al);
    }

    /**
     * showMessage: muestra un error dependiendo del codigo almacenado en
     * {@link #errorMsg}
     */
    private void showMessage() {
        setWhite();
        switch (errorMsg) {
            case 1 -> {
                JOptionPane.showMessageDialog(vista, "Error. Nombre del evento vacío o no válido.", "ERROR", JOptionPane.ERROR_MESSAGE);
                vista.getNombreEvento().setBackground(Colors.RED_BACKGROUND);
            }
            case 2 -> {
                JOptionPane.showMessageDialog(vista, "Error. Fecha no introducida.", "ERROR", JOptionPane.ERROR_MESSAGE);
            }
            case 3 -> {
                JOptionPane.showMessageDialog(vista, "Error. Fecha anterior al día de hoy.", "ERROR", JOptionPane.ERROR_MESSAGE);
            }
            case 4 -> {
                JOptionPane.showMessageDialog(vista, "Error. No has introducido número de participantes.", "ERROR", JOptionPane.ERROR_MESSAGE);
                vista.getNumeroParticipantes().setBackground(Colors.RED_BACKGROUND);
            }
            case 5 -> {
                JOptionPane.showMessageDialog(vista, "Error. Has introducido un número negativo de participantes.", "ERROR", JOptionPane.ERROR_MESSAGE);
                vista.getNumeroParticipantes().setBackground(Colors.RED_BACKGROUND);
            }
            case 6 -> {
                JOptionPane.showMessageDialog(vista, "Error. No has introducido un número válido de participantes.", "ERROR", JOptionPane.ERROR_MESSAGE);
                vista.getNumeroParticipantes().setBackground(Colors.RED_BACKGROUND);
            }
            default -> {
                System.err.println("No hay ningun error.");
            }
        }
    }

    /**
     * setWhite: actualiza todos los componentes a blanco.
     */
    private void setWhite() {
        vista.getNombreEvento().setBackground(Color.white);
        vista.getNumeroParticipantes().setBackground(Color.white);
    }

    /**
     * launchView: lanza la vista del controlador (la pone visible).
     */
    private void launchView() {
        vista.setVisible(true);
    }

}
