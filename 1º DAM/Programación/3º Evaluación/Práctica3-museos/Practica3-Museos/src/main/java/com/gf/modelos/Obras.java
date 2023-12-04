package com.gf.modelos;

/**
 *
 * @author Eduardo Martín-Sonseca y Mario Ortuñez
 */
public class Obras {
    
    // Atributos
    private int id_obra;
    private String nombre_obra;
    private String descripcion_obra;
    private String disciplina;
    private int id_muaeo;
    private int id_autor;
    
    // Constructores
    public Obras(int id_obra, String nombre_obra, String descripcion_obra, String disciplina, int id_muaeo, int id_autor) {
        this.id_obra = id_obra;
        this.nombre_obra = nombre_obra;
        this.descripcion_obra = descripcion_obra;
        this.disciplina = disciplina;
        this.id_muaeo = id_muaeo;
        this.id_autor = id_autor;
    }
    
    // Metodos Getter y Setter
    public int getId_obra() {
        return id_obra;
    }

    public void setId_obra(int id_obra) {
        this.id_obra = id_obra;
    }

    public String getNombre_obra() {
        return nombre_obra;
    }

    public void setNombre_obra(String nombre_obra) {
        this.nombre_obra = nombre_obra;
    }

    public String getDescripcion_obra() {
        return descripcion_obra;
    }

    public void setDescripcion_obra(String descripcion_obra) {
        this.descripcion_obra = descripcion_obra;
    }

    public String getDisciplina() {
        return disciplina;
    }

    public void setDisciplina(String disciplina) {
        this.disciplina = disciplina;
    }

    public int getId_muaeo() {
        return id_muaeo;
    }

    public void setId_muaeo(int id_muaeo) {
        this.id_muaeo = id_muaeo;
    }

    public int getId_autor() {
        return id_autor;
    }

    public void setId_autor(int id_autor) {
        this.id_autor = id_autor;
    }
    
    // Metodo toString
    @Override
    public String toString() {
        return "id_obra " + id_obra
                + ", nombre_obra " + nombre_obra
                + ", descripcion_obra " + descripcion_obra
                + ", disciplina " + disciplina
                + ", id_muaeo " + id_muaeo
                + ", id_autor=" + id_autor;
    }

}
