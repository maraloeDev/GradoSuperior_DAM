package com.example.examen01_eduardo_martin_sonseca;

public class Persona {

    private String nombre;
    private String edad;
    private String ciudad;

    public Persona(String nombre, String edad, String ciudad) {
        this.nombre = nombre;
        this.edad = edad;
        this.ciudad = ciudad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEdad() {
        return edad;
    }

    public void setEdad(String edad) {
        this.edad = edad;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    @Override
    public String toString() {
        return "\n" + nombre + "\n" + edad + "\n" + ciudad;
    }
}
