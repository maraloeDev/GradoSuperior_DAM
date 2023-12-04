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
 * 3. Gregorio Fernández. El usuario tiene que adivinar cual de dos imágenes de
 * esculturas planteadas, corresponde su autoría a Gregorio Fernández
 *
 *
 */
public class Juego3 {
    private final List<Obras> obras = new ArrayList<>(); // Obras seleccionadas para el juego 3
    private final List<Obras> obrasGF = new ArrayList<>(); // Obras del Gregorio Fernández entre las seleccionadas

    public Juego3(Dao dao) throws Exception {
        List<Obras> obrasGFLista = new ArrayList<>(); // Obras del Gregorio Fernández
        List<Obras> obrasNoLista = new ArrayList<>(); // Obras que no son del Gregorio Fernández
        List<Autores> autoresLista = dao.getAutores();
        Autores GF = seleccionarGF(autoresLista); // Buscar a Gregorio Fernández entre los autores
        List<Integer> indicesAleatorios = new ArrayList<>(); // Variable para guardar los índices de la lista aleatorios
        int cantidadObras = 6; // Cantidad de obras del juego

        // Guardamos las obras del GF y las que no son del GF
        for (Obras obra : dao.getObras()) {
            if (obra.getId_autor() == GF.getId_autor()) {
                obrasGFLista.add(obra);
                for (Obras obraPareja : dao.getObras()) {
                    if (obraPareja.getNombre_obra().equals(obra.getNombre_obra())) {
                        obrasNoLista.add(obraPareja);
                    }
                }
            }
        }

        // Rellenamos la lista de índices
        for (int i = 0; i < cantidadObras; i++) {
            indicesAleatorios.add(i);
        }

        // Desordenamos la lista de índices
        Collections.shuffle(indicesAleatorios);

        // Decidimos si las obras van antes (izq) o después (der) en la lista de manera aleatoria
        for (int i = 0; i < cantidadObras; i++) {
            int mezcla = (int) (Math.random() * 2);

            if (mezcla == 0) {
                this.obras.add(obrasGFLista.get(indicesAleatorios.get(i)));
                this.obras.add(obrasNoLista.get(indicesAleatorios.get(i)));
            } else {
                this.obras.add(obrasNoLista.get(indicesAleatorios.get(i)));
                this.obras.add(obrasGFLista.get(indicesAleatorios.get(i)));
            }

            // Guardamos las obras del GF en la lista de obras del GF
            this.obrasGF.add(obrasGFLista.get(indicesAleatorios.get(i)));
        }
    }

    public List<Obras> getObras() {
        return obras;
    }

    public List<Obras> getObrasGF() {
        return obrasGF;
    }

    public List<String> nombreObras() {
        List<String> nombres = new ArrayList<>();

        for (int i = 0; i < obras.size(); i += 2) {
            nombres.add(obras.get(i).getNombre_obra());
        }

        return nombres;
    }

    public List<String> urlObra() {
        List<String> urls = new ArrayList<>();

        for (int i = 0; i < obras.size(); i++) {
            urls.add(obras.get(i).getDescripcion_obra());
        }

        return urls;
    }

    public List<Character> isGF() {
        List<Character> verdaderas = new ArrayList<>();

        for (int i = 0; i < obras.size(); i += 2) {
            if (obras.get(i) == obrasGF.get(i)) {
                verdaderas.add('i'); // 'i' indica que la obra es del GF
            } else {
                verdaderas.add('d'); // 'd' indica que la obra no es del GF
            }
        }

        return verdaderas;
    }

    // Buscar obras del Gregorio Fernández
    public static Autores seleccionarGF(List<Autores> autoresLista) throws Exception {
        Autores GF = null;
        try {
            for (Autores autor : autoresLista) {
                if (autor.getNombre_autor().equals("Gregorio Fernandez")) {
                    GF = autor;
                    break;
                }
            }
            if (GF == null) {
                throw new Exception();
            }
        } catch (Exception e) {
            System.out.println("Algo sucedió y no se pudo encontrar a Gregorio Fernández entre los autores.");
            throw e;
        }
        return GF;
    }
}