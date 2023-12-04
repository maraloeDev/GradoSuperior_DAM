/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.eduardomsa.Modelo;

/**
 *
 * @author Eduardo Marrtín-Sonseca
 */
public class Familias {

    // Atributos
    private int id_familia;
    private String padre;
    private String madre;
    private String direccion;
    private String tf1;
    private String tf2;
    private String email;

    // Constructor
    public Familias(int id_familia, String padre, String madre, String direccion, String tf1, String tf2, String email) {
        this.id_familia = id_familia;
        this.padre = padre;
        this.madre = madre;
        this.direccion = direccion;
        this.tf1 = tf1;
        this.tf2 = tf2;
        this.email = email;
    }

    // Getter y Setter
    public int getId_familia() {
        return id_familia;
    }

    public void setId_familia(int id_familia) {
        this.id_familia = id_familia;
    }

    public String getPadre() {
        return padre;
    }

    public void setPadre(String padre) {
        this.padre = padre;
    }

    public String getMadre() {
        return madre;
    }

    public void setMadre(String madre) {
        this.madre = madre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTf1() {
        return tf1;
    }

    public void setTf1(String tf1) {
        this.tf1 = tf1;
    }

    public String getTf2() {
        return tf2;
    }

    public void setTf2(String tf2) {
        this.tf2 = tf2;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // toString
    @Override
    public String toString() {
        return "Familias{"
                + "id_familia=" + id_familia
                + ", padre=" + padre
                + ", madre=" + madre
                + ", direccion=" + direccion
                + ", tf1=" + tf1
                + ", tf2=" + tf2
                + ", email=" + email + '}';
    }

}
