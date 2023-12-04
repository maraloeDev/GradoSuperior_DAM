/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package Ejemplos;


import java.util.ArrayList;
import java.util.LinkedList;
import java.util.logging.Level;

/**
 *
 * @author maraloed
 */
public class EjemploFila {

    public static void main(String[] args) {
        ArrayList<String> platos = new ArrayList<>();
        LinkedList<String> pilaPlatos = new LinkedList<>();

        platos.add("Plato1");
        platos.add("Plato2");
        platos.add("Plato3");
        platos.add("Plato4");
        platos.add("Plato5");
        platos.add("Plato6");

        for (String plato : platos) {
            pilaPlatos.add(plato);
        }
        //Mostramos como estan los platos
        System.out.println(platos.toString());

        //Vamos cogfiendo platos de la pila
        while (!platos.isEmpty()) {

            try {
                Thread.sleep(2000);
            } catch (InterruptedException ex) {
                java.util.logging.Logger.getLogger(EjemploFila.class.getName()).log(Level.SEVERE, null, ex);
            }
                System.out.println("Cogiendo el plato " + pilaPlatos.pop());
                System.out.println(pilaPlatos);



            
        }
    }

}
