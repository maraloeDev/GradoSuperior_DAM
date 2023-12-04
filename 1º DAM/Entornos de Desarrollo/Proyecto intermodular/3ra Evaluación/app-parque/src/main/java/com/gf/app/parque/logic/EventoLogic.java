/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gf.app.parque.logic;

import com.gf.app.parque.dao.EventoDAO;
import com.gf.app.parque.entities.Evento;
import java.sql.SQLException;

/**
 * EventoLogic: clase que permite aplicar la logica de negocio y acceder a la
 * base de datos, en concreto la tabla 'evento'.
 *
 * @author priparno
 */
public class EventoLogic {

    /**
     * evDAO: objeto de acceso a datos de evento.
     */
    private EventoDAO evDAO = new EventoDAO();

    /**
     * DEFAULT CONSTRUCTOR
     */
    public EventoLogic() {
    }

    /**
     * insert: dependiendo de los campos del evento pasado como parametro,
     * inserta en la base de datos dicho evento.
     * <br>
     * <ul>
     * <li>Si el numero de sala y el menu no han sido seleccionados: introduce
     * poniendo nulos al id de menú y numero de sala</li>
     * <li>Si el numero de sala no ha sido seleccionado: introduce poniendo nulo
     * el numero de sala</li>
     * <li>Si el id de menú no ha sido seleccionado: introduce poniendo nulo el
     * id del menú</li>
     * <li>Si todo ha sido seleccionado: introduce con todos los campos.</li>
     * </ul>
     *
     * @see EventoDAO
     * @see Evento
     *
     * @param e el evento a insertar
     * @return true -> se ha insertado, false -> no se ha insertado
     * @throws SQLException si no consigue acceder a la base de datos (error
     * sintactico o base de datos no encontrada)
     */
    public boolean insert(Evento e) throws SQLException {
        if (e.getNumero_sala() == null && e.getId_evento() == null) {
            return evDAO.insertWONumSalaIdMenu(e) > 0;
        } else if (e.getNumero_sala() == null) {
            return evDAO.insertWONumSala(e) > 0;
        } else if (e.getId_menu() == null) {
            return evDAO.insertWOIdMenu(e) > 0;
        }
        return evDAO.insert(e) > 0;
    }

}
