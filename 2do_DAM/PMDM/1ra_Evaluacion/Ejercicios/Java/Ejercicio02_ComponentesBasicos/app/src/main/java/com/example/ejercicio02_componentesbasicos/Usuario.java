package com.example.ejercicio02_componentesbasicos;

import java.util.ArrayList;
import java.util.SplittableRandom;

public class Usuario {

    // Atributos
    private String nombre;
    private String estado;
    private String ciudadesAutonomas;
    private ArrayList<String> deportes;

    // Constructores
    public Usuario(String nombre, String estado, String ciudadesAutonomas, ArrayList<String> deportes) {
        this.nombre = nombre;
        this.estado = estado;
        this.ciudadesAutonomas = ciudadesAutonomas;
        this.deportes = deportes;
    }

    public Usuario() {
    }

    public Usuario(String nombre) {
        this.nombre = nombre;
    }

    // Getter y Setter
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String isEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getCiudadesAutonomas() {
        return ciudadesAutonomas;
    }

    public void setCiudadesAutonomas(String ciudadesAutonomas) {
        this.ciudadesAutonomas = ciudadesAutonomas;
    }

    public ArrayList<String> getDeportes() {
        return deportes;
    }

    public void setDeportes(ArrayList<String> deportes) {
        this.deportes = deportes;
    }

    // toString

    @Override
    public String toString() {
        return "Usuario{" +
                "nombre='" + nombre + '\'' +
                ", estado=" + estado +
                ", ciudadesAutonomas=" + ciudadesAutonomas +
                ", deportes='" + deportes + '\'' +
                '}';
    }
}
