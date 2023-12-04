/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package EjerciciosTEMA7.PDFPilasColas;

import java.util.Arrays;
import java.util.LinkedList;



/**
 *
 * @author Eduardo Martin - Sonseca
 */


  public class Ejercicio_6_InvertirEnteros {
    public static void main(String[] args) {
        int[] numeros;
        numeros = new int[6];
        LinkedList<Integer> pilaNumeros = new LinkedList<>();
        
        
        for (int i = 0; i < numeros.length; i++) {
            numeros[i] = i+1;
        }
        
        System.out.println(Arrays.toString(numeros));
        for(Integer numero:numeros){
            pilaNumeros.push(numero);
        }
        System.out.println(pilaNumeros);
    }
  }
