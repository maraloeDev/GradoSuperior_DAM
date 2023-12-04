/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package Ejemplos;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

/**
 *
 * @author maraloed
 */

// Son utiles para recuperar valores por clave,

public class EjemploMapas {
    
public static void mostramosPares(Map mapa){
    
    Set setPares = mapa.entrySet();
    
    System.out.println(setPares);
    for(Object par : mapa.entrySet()){
        
        
    }
    String resultado = (String) mapa.get(99);
mapa.containsValue(99);
}
    public static void pruebaMapa(Map mapa){
        //Introducimos u objetos en el mapa
        //Para añadir u ndato en un mapa el put
        
        mapa.put(1, "cliente1");
        mapa.put(2, "cliente2");
        mapa.put(3, "cliente3");
        mapa.put(4, "cliente4");
        
        //Mostramos el contenido del mapa
        System.out.println(mapa);
    }
    public static void main(String[] args) {
        
        Map mapa1 = new HashMap();
        Map mapa2 = new TreeMap();
        
        pruebaMapa(mapa1);
        pruebaMapa(mapa2);
        
        //mostramos solamenrte los valores
        
        System.out.println(mapa1.keySet()); //Devuelve solamente las claves
        System.out.println();
        
        //Vaciar mapa
        
        mapa1.clear();
        
        mapa1.isEmpty();
    }
    
}
