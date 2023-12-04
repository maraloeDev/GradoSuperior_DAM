/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gf.controles;

import com.gf.modelos.Autores;
import java.util.List;

/**
 *
 * @author Eduardo Martín-Sonseca y Mario Ortuñez
 */
public class ControlJuegos {
    
     // Metodo para saber si esta repetido el aleatorio
    public static boolean idRepetida(List<Integer> aleatoriosSel, int aleatorio) {
        // Variable
        boolean repetida = false;// Variable que se retorna, true si esta repetido, y false si no lo esta
        // Instrucciones
        for (int i = 0; i < aleatoriosSel.size(); i++) {// Bucle for para recorrer todos los aleatorios ya seleccionados
            if (aleatoriosSel.get(i) == aleatorio) {// SI esta repetido 
                repetida = true;// La variable se torna true
                break;// Salimos ya del bucle, porque no hace falta seguir
            }
        }
        return repetida;// Retornamos el boleano
    }


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
            System.out.println("Algo sucedio y no se pudo encontrar entre los autores a Gregorio Fernandez");
            throw e;
        }
        return GF;
    }
}