package com.gf.controles;

import com.gf.dao.Dao;
import com.gf.modelos.Autores;
import com.gf.modelos.Museos;
import com.gf.modelos.Obras;
import com.gf.modelos.Paises;
import java.util.ArrayList;
import java.util.List;

/*
 * Clase del primer juego
 *
 * Enunciado: 1. ¿Quién lo hizo? A partir de unas imágenes de obras de arte
 * genéricas, hay que adivinar su autor
 *
 *
 * Lógica: Esta clase representa el juego en el que se debe adivinar el autor de
 * una obra de arte a partir de imágenes genéricas. Al crear un objeto de esta
 * clase, se genera una lista de obras que aparecerán en el juego.
 *
 * En el constructor, se recorre un bucle 10 veces para seleccionar obras
 * aleatorias. En cada iteración, se genera un número aleatorio entre 1 y el
 * número total de obras disponibles. Se verifica que el número no haya sido
 * seleccionado previamente para evitar repeticiones. Utilizando el número
 * aleatorio como índice, se obtiene la obra correspondiente de la lista de
 * obras y se agrega a la lista del juego.
 *
 * Una vez que la lista está llena, se proporcionan métodos para obtener la
 * lista de obras, los nombres de las obras y las URLs de las imágenes de las
 * obras y los autores de las obras. Los últimos tres métodos recopilan los
 * nombres de las obras y de los autores, ademas de las URLs en listas separadas
 * y las devuelven como resultado.
 * @author Eduardo Martín-Sonseca y Mario Ortuñez
 */
public class Juego1 {

    private final List<Obras> obras = new ArrayList<>(); // Variable que guarda las obras que aparecerán en el juego

    public Juego1(Dao dao) {
        List<Integer> obrasSeleccionadas = new ArrayList<>(); // Variable para guardar las ids de las obras que ya han sido seleccionadas
        int numeroObrasJuego = 10;

        for (int i = 0; i < numeroObrasJuego; i++) { // Generar las obras seleccionadas
            int aleatorio;
            do {
                aleatorio = (int) (Math.random() * dao.getObras().size()); // Generar un número aleatorio entre 0 y el tamaño de la lista de obras - 1
            } while (ControlJuegos.idRepetida(obrasSeleccionadas, aleatorio)); // Verificar si el índice ya ha sido seleccionado

            obras.add(dao.getObras().get(aleatorio)); // Añadir la obra seleccionada a la lista de obras del juego
            obrasSeleccionadas.add(aleatorio); // Guardar el índice de la obra seleccionada
        }
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

    // Lista de los países donde se encuentran las obras del juego 4 mediante su museo.
    public List<String> autoresObra(Dao dao) throws NullPointerException {
        List<String> autores = new ArrayList<>();
        for (Obras obra : obras) {
            try {
                for (Autores autor : dao.getAutores()) {// Buscamos entre todos los autores cual tiene la id correspondiente
                    if (autor.getId_autor() == obra.getId_autor()) {
                        autores.add(autor.getNombre_autor());// Añadimos a la lista
                        break;
                    }
                }
            } catch (NullPointerException e) {// Controlamos la excepcion
                System.out.println("No se pudo encontrar el autor de la obra.");
                throw e;
            }
        }
        return autores;
    }
}