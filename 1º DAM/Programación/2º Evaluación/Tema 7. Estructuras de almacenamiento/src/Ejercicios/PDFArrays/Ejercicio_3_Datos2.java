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
public class Ejercicio_3_Datos2 {

    static Random rndm = new Random();
    static int numeros[] = new int[10];

    public static void sumaImpares() {

        int suma = 0;

        for (int i = 1; i < 10; i = i + 2) { //Muestro la suma del array
            suma = suma + numeros[i];

        }
        System.out.println("La suma de los numeros pares en las posiciones impares es de " + suma);

    }

    public static void main(String[] args) {
        for (int i = 0; i < numeros.length; i++) { //Muestro el array
            numeros[i] = rndm.nextInt(1, 10);

        }

        System.out.println(Arrays.toString(numeros));

        sumaImpares();

    }
}
