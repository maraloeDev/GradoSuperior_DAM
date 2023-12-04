/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gf.app.parque.entities;

/**
 * Menu: representa un menu de la base de datos.
 *
 * @author priparno
 */
public class Menu {

    /**
     * id_menu: el identificador del menu.
     */
    private Integer id_menu;
    /**
     * nombre_menu: el nombre del menu.
     */
    private String nombre_menu;
    /**
     * precio_menu: el precio del menu.
     */
    private Double precio_menu;

    /**
     * DEFAULT CONSTRUCTOR
     */
    public Menu() {
    }

    /**
     * getId_menu: devuelve un entero que representa el identificador del menu.
     *
     * @return un entero
     */
    public Integer getId_menu() {
        return id_menu;
    }

    /**
     * setId_menu: actualiza el id_menu con el entero pasado por parametro.
     *
     * @param id_menu un entero que representa el identificador del menu
     */
    public void setId_menu(Integer id_menu) {
        this.id_menu = id_menu;
    }

    /**
     * getNombre_menu: devuelve una cadena con el nombre del menu.
     *
     * @return una cadena
     */
    public String getNombre_menu() {
        return nombre_menu;
    }

    /**
     * setNombre_menu: actualiza el nombre del menu segun la cadena pasada por
     * parametro.
     *
     * @param nombre_menu una cadena que representa el nombre del menu
     */
    public void setNombre_menu(String nombre_menu) {
        this.nombre_menu = nombre_menu;
    }

    /**
     * getPrecio_menu: devuelve un numero decimal que representa el precio del
     * menu.
     *
     * @return un numero decimal
     */
    public Double getPrecio_menu() {
        return precio_menu;
    }

    /**
     * setPrecio_menu: actualiza el precio del menu con el numero pasado por
     * parametro.
     *
     * @param precio_menu un numero decimal que representa el precio del menu
     */
    public void setPrecio_menu(Double precio_menu) {
        this.precio_menu = precio_menu;
    }

    /**
     * toString: devuelve una cadena con el nombre del menu.
     *
     * @return una cadena
     */
    @Override
    public String toString() {
        return nombre_menu;
    }

}
