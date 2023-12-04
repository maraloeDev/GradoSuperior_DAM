/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gf.controles;

import com.gf.dao.Dao;
import com.gf.modelos.Autores;
import com.gf.modelos.Obras;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author Eduardo Martín-Sonseca y Mario Ortuñez
 *
 * Clase del primer juego
 *
 * Enunciado: 1. ¿Quién lo hizo? A partir de unas imágenes de obras de arte
 * genéricas, hay que adivinar su autor
 *
 */
public class MetodosJuego1 {

    private final List<Obras> obras = new ArrayList<>(); // Variable que guarda las obras que aparecerán en el juego

    public MetodosJuego1(Dao dao) {
        List<Obras> obrasTodas = dao.getObras(); // Variable donde guardamos todas las obras
        int numeroObrasJuego = 10;

        Collections.shuffle(obrasTodas); // Desordenamos la lista de obras
        int obrasTotales = obrasTodas.size();
        int obrasAgregadas = Math.min(numeroObrasJuego, obrasTotales);
        obras.addAll(obrasTodas.subList(0, obrasAgregadas)); // Añadimos a la lista las obras para el juego
    }

    public List<Obras> getObras() {
        return obras;
    }

    public List<String> nombreObras() {
        List<String> nombres = new ArrayList<>();
        for (Obras obra : obras) {
            nombres.add(obra.getNombre_obra());
        }
        return nombres;
    }

    public List<String> urlImg() {
        List<String> urls = new ArrayList<>();
        for (Obras obra : obras) {
            urls.add(obra.getDescripcion_obra());
        }
        return urls;
    }

    // Obtener los nombres de los autores de las obras del juego 1 
    public List<String> autoresObra(Dao dao) {
        List<String> autores = new ArrayList<>();
        for (Obras obra : obras) {
            boolean autorEncontrado = false;
            for (Autores autor : dao.getAutores()) {
                if (autor.getId_autor() == obra.getId_autor()) {
                    autores.add(autor.getNombre_autor());
                    autorEncontrado = true;
                    break;
                }
            }
            if (!autorEncontrado) {
                autores.add("Autor desconocido");
            }
        }
        return autores;
    }
}
