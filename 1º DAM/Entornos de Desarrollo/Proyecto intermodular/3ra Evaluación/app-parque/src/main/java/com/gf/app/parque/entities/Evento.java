/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gf.app.parque.entities;

import java.time.LocalDate;

/**
 * Evento: representa un evento de la base de datos.
 *
 * @author priparno
 */
public class Evento {

    /**
     * id_evento: el identificador del evento.
     */
    private Integer id_evento;
    /**
     * nombre_evento: el nombre del evento.
     */
    private String nombre_evento;
    /**
     * fecha_evento: la fecha cuando se va a celebrar el evento.
     */
    private LocalDate fecha_evento;
    /**
     * numero_sala: el numero de la sala escogido.
     */
    private Integer numero_sala;
    /**
     * numero_participantes: el numero de participantes/asistentes.
     */
    private Integer numero_participantes;
    /**
     * es_cumple: si es cumple o no.
     */
    private boolean es_cumple;
    /**
     * id_menu: el identificador del menu.
     */
    private Integer id_menu;

    /**
     * DEFAULT CONSTRUCTOR
     */
    public Evento() {
    }

    /**
     * getId_evento: devuelve un entero que representa el identificador del
     * evento.
     *
     * @return un entero
     */
    public Integer getId_evento() {
        return id_evento;
    }

    /**
     * setId_evento: actualiza el identificador del evento segun el entero
     * pasado por parametro.
     *
     * @param id_evento un entero que representa el id del evento
     */
    public void setId_evento(Integer id_evento) {
        this.id_evento = id_evento;
    }

    /**
     * getNombre_evento: devuelve una cadena con el nombre del evento.
     *
     * @return una cadena
     */
    public String getNombre_evento() {
        return nombre_evento;
    }

    /**
     * setNombre_evento: actualiza el nombre del evento con la cadena pasada por
     * parametro.
     *
     * @param nombre_evento una cadena que representa el nombre del evento
     */
    public void setNombre_evento(String nombre_evento) {
        this.nombre_evento = nombre_evento;
    }

    /**
     * getFecha_evento: devuelve la fecha del evento en un objeto tipo
     * {@link LocalDate}.
     *
     * @return un objeto LocalDate que representa la fecha del evento
     */
    public LocalDate getFecha_evento() {
        return fecha_evento;
    }

    /**
     * setFecha_evento: actualiza la fecha del evento con la pasada por
     * parametro.
     *
     * @param fecha_evento un objeto LocalDate que representa la fecha del
     * evento
     */
    public void setFecha_evento(LocalDate fecha_evento) {
        this.fecha_evento = fecha_evento;
    }

    /**
     * getNumero_sala: devuelve un entero que representa el numero de sala
     * escogido.
     *
     * @return un entero
     */
    public Integer getNumero_sala() {
        return numero_sala;
    }

    /**
     * setNumero_sala: actualiza el numero de sala con el entero pasado por
     * parametro.
     *
     * @param numero_sala un entero que representa el numero de sala
     */
    public void setNumero_sala(Integer numero_sala) {
        this.numero_sala = numero_sala;
    }

    /**
     * getNumero_participantes: devuelve un entero con el numero de
     * participantes.
     *
     * @return un entero
     */
    public Integer getNumero_participantes() {
        return numero_participantes;
    }

    /**
     * setNumero_participantes: actualiza el numero de participantes con el
     * entero pasado por parametro.
     *
     * @param numero_participantes un entero que representa el numero de
     * participantes.
     */
    public void setNumero_participantes(Integer numero_participantes) {
        this.numero_participantes = numero_participantes;
    }

    /**
     * isEs_cumple: devuelve un booleano que dice si es cumpleanios o no.
     *
     * @return true -> es cumpleanios, false -> no es cumpleanios
     */
    public boolean isCumple() {
        return es_cumple;
    }

    /**
     * setEs_cumple: actualiza si es cumpleanios o no.
     *
     * @param es_cumple un booleano, true -> es cumpleanios, false -> no es
     * cumpleanios
     */
    public void setEs_cumple(boolean es_cumple) {
        this.es_cumple = es_cumple;
    }

    /**
     * getId_menu: devuelve un entero que representa el id del menu escogido
     * para el evento.
     *
     * @return un entero
     */
    public Integer getId_menu() {
        return id_menu;
    }

    /**
     * setId_menu: actualiza el id del menu con el entero pasado por parametro.
     * 
     * @param id_menu un entero que representa el id del menu
     */
    public void setId_menu(Integer id_menu) {
        this.id_menu = id_menu;
    }

    /**
     * toString: devuelve el evento con su id, nombre, fecha y numero de sala.
     * 
     * @return una cadena
     */
    @Override
    public String toString() {
        return "Evento(" + id_evento + "): Nombre=" + nombre_evento + ", fecha=" + fecha_evento + ", numero sala=" + numero_sala;
    }

}
