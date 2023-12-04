package com.gf.modelos;

/**
 *
 * @author Eduardo Martín-Sonseca y Mario Ortuñez
 */
public class Autores {
    
    // Atributos
    private int id_autor;
    private String nombre_autor;
    private int id_pais;
    
    // Constructores
    public Autores(int id_autor, String nombre_autor, int id_pais) {
        this.id_autor = id_autor;
        this.nombre_autor = nombre_autor;
        this.id_pais = id_pais;
    }
    
    // Metodos Getter y Setter
    
    public int getId_autor() {
        return id_autor;
    }

    public void setId_autor(int id_autor) {
        this.id_autor = id_autor;
    }

    public String getNombre_autor() {
        return nombre_autor;
    }

    public void setNombre_autor(String nombre_autor) {
        this.nombre_autor = nombre_autor;
    }

    public int getId_pais() {
        return id_pais;
    }

    public void setId_pais(int id_pais) {
        this.id_pais = id_pais;
    }

    // Metodo toString
    @Override
    public String toString() {
        return "id_autor " + id_autor + ", nombre_autor " + nombre_autor + ", id_pais " + id_pais;
    }

}
