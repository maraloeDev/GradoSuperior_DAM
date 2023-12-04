package com.gf.modelos;

/**
 *
 * @author Eduardo Martín-Sonseca y Mario Ortuñez
 */
public class Museos {

    // Atributos
    private int id_museo;
    private String nombre_museo;
    private int id_pais;
    private boolean existe_museo;
    
    // Constructor
    public Museos(int id_museo, String nombre_museo, int id_pais, boolean existe_museo) {
        this.id_museo = id_museo;
        this.nombre_museo = nombre_museo;
        this.id_pais = id_pais;
    }
    
    // Metodos Getter y Setter
    public int getId_museo() {
        return id_museo;
    }

    public void setId_museo(int id_museo) {
        this.id_museo = id_museo;
    }

    public String getNombre_museo() {
        return nombre_museo;
    }

    public void setNombre_museo(String nombre_museo) {
        this.nombre_museo = nombre_museo;
    }

    public int getId_pais() {
        return id_pais;
    }

    public void setId_pais(int id_pais) {
        this.id_pais = id_pais;
    }

    public boolean isExiste_museo() {
        return existe_museo;
    }

    public void setExiste_museo(boolean existe_museo) {
        this.existe_museo = existe_museo;
    }
    
    // Metodo toString 
    @Override
    public String toString() {
        return "id_museo=" + id_museo + ", nombre_museo=" + nombre_museo + ", id_pais=" + id_pais + ", existe_museo=" + existe_museo;
    }

}
