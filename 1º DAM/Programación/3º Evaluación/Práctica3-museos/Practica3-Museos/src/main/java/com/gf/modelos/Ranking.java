package com.gf.modelos;

/**
 *
 * @author Eduardo Martín-Sonseca y Mario Ortuñez
 */
public class Ranking {
    
    // Atributos
    public int id_ranking;
    public String nombre_jugador;
    public int puntos_Jugador;

    // Constructor
    public Ranking(int id_ranking, String nombre_jugador, int puntos_Jugador) {
        this.id_ranking = id_ranking;
        this.nombre_jugador = nombre_jugador;
        this.puntos_Jugador = puntos_Jugador;
    }
    
    // Metodos Getter y Setter
    public int getId_ranking() {
        return id_ranking;
    }

    public void setId_ranking(int id_ranking) {
        this.id_ranking = id_ranking;
    }

    public String getNombre_jugador() {
        return nombre_jugador;
    }

    public void setNombre_jugador(String nombre_jugador) {
        this.nombre_jugador = nombre_jugador;
    }

    public int getPuntos_Jugador() {
        return puntos_Jugador;
    }

    public void setPuntos_Jugador(int puntos_Jugador) {
        this.puntos_Jugador = puntos_Jugador;
    }
    
    // Metodo toString
    @Override
    public String toString() {
        return "id_ranking " + id_ranking + ", nombre_jugador " + nombre_jugador + ", puntos_Jugador " + puntos_Jugador + '}';
    }
    
    
    
}
