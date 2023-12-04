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
public class Ninios {

    // Atributos
    private int id_ninio;
    private String nombre;
    private Date fecha_nac;
    private int familia;

    // Constructor
    public Ninios(int id_ninio, String nombre, Date fecha_nac, int familia) {
        this.id_ninio = id_ninio;
        this.nombre = nombre;
        this.fecha_nac = fecha_nac;
        this.familia = familia;
    }

    // Getter y Setter
    public int getId_ninio() {
        return id_ninio;
    }

    public void setId_ninio(int id_ninio) {
        this.id_ninio = id_ninio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Date getFecha_nac() {
        return fecha_nac;
    }

    public void setFecha_nac(Date fecha_nac) {
        this.fecha_nac = fecha_nac;
    }

    public int getFamilia() {
        return familia;
    }

    public void setFamilia(int familia) {
        this.familia = familia;
    }

    // toString
    @Override
    public String toString() {
        return "Ninios{"
                + "id_ninio=" + id_ninio
                + ", nombre=" + nombre
                + ", fecha_nac=" + fecha_nac
                + ", familia=" + familia + '}';
    }

}
