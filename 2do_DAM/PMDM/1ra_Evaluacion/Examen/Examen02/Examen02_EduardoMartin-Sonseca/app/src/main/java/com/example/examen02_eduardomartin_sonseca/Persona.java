package com.example.examen02_eduardomartin_sonseca;

public class Persona {

    private String nombre;
    private int sexo;

    public Persona(String nombre, int sexo) {
        this.nombre = nombre;
        this.sexo = sexo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getSexo() {
        return sexo;
    }

    public void setSexo(int sexo) {
        this.sexo = sexo;
    }

    @Override
    public String toString() {
        return "Nombre: " + nombre +
                "\n" +
                "Sexo: " + sexo;
    }
}
