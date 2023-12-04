/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.eduardomsa.Modelo;

import java.sql.Date;

/**
 *
 * @author Eduardo Martín-Sonseca
 */
public class Items {

    // Atributos
    private int id_item;
    private Date fecha;
    private int tipo;
    private String descripcion;
    private int id_ninio;

    // Constructor
    public Items(int id_item, Date fecha, int tipo, String descripcion, int id_ninio) {
        this.id_item = id_item;
        this.fecha = fecha;
        this.tipo = tipo;
        this.descripcion = descripcion;
        this.id_ninio = id_ninio;
    }

    // Getter y Setter
    public int getId_item() {
        return id_item;
    }

    public void setId_item(int id_item) {
        this.id_item = id_item;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getId_niño() {
        return id_ninio;
    }

    public void setId_niño(int id_niño) {
        this.id_ninio = id_niño;
    }

    // toString
    @Override
    public String toString() {
        return "Items{"
                + "id_item=" + id_item
                + ", fecha=" + fecha
                + ", tipo=" + tipo
                + ", descripcion=" + descripcion
                + ", id_ninio=" + id_ninio + '}';
    }

}
