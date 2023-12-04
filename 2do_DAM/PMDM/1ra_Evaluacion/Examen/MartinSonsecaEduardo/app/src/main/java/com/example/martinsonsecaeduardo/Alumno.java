package com.example.martinsonsecaeduardo;

public class Alumno {

    private String nombre;
    private String calificacion;

    public Alumno(String nombre, String calificacion) {
        this.nombre = nombre;
        this.calificacion = calificacion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(String calificacion) {
        this.calificacion = calificacion;
    }

    @Override
    public String toString() {
        return "\n" + "Nombre " + nombre + "\n" + "Calificacion " + calificacion;
    }
}
