/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package Ejercicios.PDFArrays;

import java.util.Arrays;
import java.util.Random;

/**
 *
 * @author Eduardo Martin - Sonseca 
 */
public class Ejercicio_5_ListaAleatoria {
    
    static Random rndm = new Random();
    static int[] enteros = new int[10];
    
    public static void main(String[] args) {
        for (int i = 1; i < enteros.length; i++) {
            
            enteros[i] = rndm.nextInt(1, 10);
            
        }
        System.out.println(Arrays.toString(enteros));
    }
    
}
