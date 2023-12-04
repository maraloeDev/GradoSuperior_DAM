/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gf.app.parque.dao;

import com.gf.app.parque.entities.Evento;
import com.gf.app.parque.resources.ConexionBD;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;

/**
 * EventoDAO: es la clase de acceso a datos de la base de datos, en concreto la
 * tabla 'evento'.
 *
 * @author priparno
 */
public class EventoDAO {

    /**
     * DEFAULT CONSTRUCTOR
     */
    public EventoDAO() {
    }

    /**
     * insert: inserta un evento con todos los campos. No se inserta el
     * id_evento porque es autoincrement.
     *
     * @see Evento
     *
     * @param e el evento a insertar
     * @return un entero. <ul><li>1: ha conseguido insertar</li><li>0: no lo ha
     * conseguido</li></ul>
     * @throws SQLException si no consigue acceder a la base de datos (error
     * sintactico o base de datos no encontrada)
     */
    public int insert(Evento e) throws SQLException {
        String sql = "INSERT INTO evento (nombre_evento, fecha_evento, numero_personas, numero_sala, es_cumple, id_menu) VALUES (?,?,?,?,?,?)";
        try ( Connection con = ConexionBD.getConnection()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, e.getNombre_evento());
            ps.setDate(2, Date.valueOf(e.getFecha_evento()));
            ps.setInt(3, e.getNumero_participantes());
            ps.setInt(4, e.getNumero_sala());
            ps.setBoolean(5, e.isCumple());
            ps.setInt(6, e.getId_menu());
            return ps.executeUpdate();
        }
    }

    /**
     * insertWOIdMenu: inserta un evento sin menu. No se inserta el id_evento
     * porque es autoincrement.
     *
     * @param e el evento a insertar
     * @return un entero. <ul><li>1: ha conseguido insertar</li><li>0: no lo ha
     * conseguido</li></ul>
     * @throws SQLException si no consigue acceder a la base de datos (error
     * sintactico o base de datos no encontrada)
     */
    public int insertWOIdMenu(Evento e) throws SQLException {
        String sql = "INSERT INTO evento (nombre_evento, fecha_evento, numero_personas, numero_sala, es_cumple) VALUES (?,?,?,?,?)";
        try ( Connection con = ConexionBD.getConnection()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, e.getNombre_evento());
            ps.setDate(2, Date.valueOf(e.getFecha_evento()));
            ps.setInt(3, e.getNumero_participantes());
            ps.setInt(4, e.getNumero_sala());
            ps.setBoolean(5, e.isCumple());
            return ps.executeUpdate();
        }
    }

    /**
     * insertWONumSala: inserta un evento sin numero de sala. No se inserta el
     * id_evento porque es autoincrement.
     *
     * @param e el evento a insertar
     * @return un entero. <ul><li>1: ha conseguido insertar</li><li>0: no lo ha
     * conseguido</li></ul>
     * @throws SQLException si no consigue acceder a la base de datos (error
     * sintactico o base de datos no encontrada)
     */
    public int insertWONumSala(Evento e) throws SQLException {
        String sql = "INSERT INTO evento (nombre_evento, fecha_evento, numero_personas, es_cumple, id_menu) VALUES (?,?,?,?,?)";
        try ( Connection con = ConexionBD.getConnection()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, e.getNombre_evento());
            ps.setDate(2, Date.valueOf(e.getFecha_evento()));
            ps.setInt(3, e.getNumero_participantes());
            ps.setBoolean(4, e.isCumple());
            ps.setInt(5, e.getId_menu());
            return ps.executeUpdate();
        }
    }

    /**
     * insertWONumSala: inserta un evento sin numero de sala ni menú. No se
     * inserta el id_evento porque es autoincrement.
     *
     * @param e el evento a insertar
     * @return un entero. <ul><li>1: ha conseguido insertar</li><li>0: no lo ha
     * conseguido</li></ul>
     * @throws SQLException si no consigue acceder a la base de datos (error
     * sintactico o base de datos no encontrada)
     */
    public int insertWONumSalaIdMenu(Evento e) throws SQLException {
        String sql = "INSERT INTO evento (nombre_evento, fecha_evento, numero_personas, es_cumple) VALUES (?,?,?,?)";
        try ( Connection con = ConexionBD.getConnection()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, e.getNombre_evento());
            ps.setDate(2, Date.valueOf(e.getFecha_evento()));
            ps.setInt(3, e.getNumero_participantes());
            ps.setBoolean(4, e.isCumple());
            return ps.executeUpdate();
        }
    }
}
