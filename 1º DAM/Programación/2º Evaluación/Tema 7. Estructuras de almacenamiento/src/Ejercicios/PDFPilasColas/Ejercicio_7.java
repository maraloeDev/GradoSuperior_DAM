/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package EjerciciosTEMA7.PDFPilasColas;

import java.util.Collections;
import java.util.LinkedList;
import java.util.Random;

/**
 *
 * @author maraloed
 */
public class Ejercicio_7 {
    
    public class Ejercicio_6_InvertirEnteros {

    public  void rellenaPila(LinkedList pila) {
        Random rand = new Random();
        int tam = rand.nextInt(1, 21);
        for (int i = 0; i < tam; i++) {
            pila.push(rand.nextInt(1, 101));
        }
    }

    public  void ordenaAsc(LinkedList pila) {
        Collections.sort(pila);
    }

    public  void ordenaDesc(LinkedList pila) {
        Collections.sort(pila, Collections.reverseOrder());
    }

    public  void main(String[] args) {
        LinkedList<Integer> pila1 = new LinkedList<>();
        LinkedList<Integer> pila2 = new LinkedList<>();
        LinkedList<Integer> solucion = new LinkedList<>();
        rellenaPila(pila1);
        rellenaPila(pila2);
        ordenaAsc(pila1);
        ordenaDesc(pila2);
        System.out.println(pila1);
        System.out.println(pila2);

        //Con la ordenacion
        solucion.addAll(pila1);
        solucion.addAll(pila2);
        ordenaDesc(solucion);
        System.out.println(solucion);

        //Con bucles
        solucion.clear();
        ordenaAsc(pila2);
        while (!pila1.isEmpty() || !pila2.isEmpty()) {
            if (pila1.isEmpty() && !pila2.isEmpty()) {
                while (!pila2.isEmpty()) {
                    solucion.push(pila2.pop());
                }
            } else if (pila2.isEmpty() && !pila1.isEmpty()) {
                while (!pila1.isEmpty()) {
                    solucion.push(pila1.pop());
                }
            } else {
                if (pila2.getFirst() <= pila1.getFirst()) {
                    solucion.push(pila2.pop());
                } else {
                    solucion.push(pila1.pop());
                }
            }
        }
        System.out.println(solucion);
    }
    }
}
