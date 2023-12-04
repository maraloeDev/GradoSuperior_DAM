/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gf.controles;

import com.gf.dao.Dao;
import com.gf.modelos.Museos;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author Eduardo Martín-Sonseca y Mario Ortuñez
 * 
 *
 * Clase del segundo juego
 *
 * Enunciado: 2. Verdadero/Falso de Museos Se mostrará una lista de nombres de
 * museos y el usuario tiene que decir si existen o no.
 *
 */
public class Juego2 {
    private final List<Museos> museos = new ArrayList<>(); // Variable que guarda los museos del juego
    private final List<Museos> museosExistentes = new ArrayList<>(); // Variable que guarda los museos existentes en el juego

    public Juego2(Dao dao) {
        List<Museos> museosFalsos = new ArrayList<>(); // Variable para almacenar los museos falsos
        List<Museos> museosVerdaderos = new ArrayList<>(); // Variable para almacenar los museos verdaderos

        // Separar los museos en verdaderos y falsos
        for (Museos museo : dao.getMuseos()) {
            if (museo.isExiste_museo()) {
                museosVerdaderos.add(museo);
            } else {
                museosFalsos.add(museo);
            }
        }

        // Desordenar las listas
        Collections.shuffle(museosFalsos);
        Collections.shuffle(museosVerdaderos);

        // Tomar la cantidad mínima entre 3 y el tamaño de museosVerdaderos
        int nMuseosVerdaderos = Math.min(3, museosVerdaderos.size());
        museos.addAll(museosVerdaderos.subList(0, nMuseosVerdaderos));
        museosExistentes.addAll(museosVerdaderos.subList(0, nMuseosVerdaderos));

        // Agregar los museos falsos
        int nMuseosFalsos = Math.min(7, museosFalsos.size());
        museos.addAll(museosFalsos.subList(0, nMuseosFalsos));

        Collections.shuffle(museos);
    }

    public List<Museos> getMuseos(String museoSeleccionado) {
        return museos;
    }

    public List<Museos> getMuseosExistentes() {
        return museosExistentes;
    }

    public List<String> getNombresMuseos() {
        List<String> nombres = new ArrayList<>();
        for (Museos museo : museos) {
            nombres.add(museo.getNombre_museo());
        }
        return nombres;
    }
}
