/*
 * * *****************************************************************************
 *  * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 *  *****************************************************************************
 */

package Ejercicios.PDFMatrices;

import java.util.Random;

public class Ejercicio_2_MatrizTraspuesta {


    static Random rndm = new Random();

    public void matNorm(int m[][]) {
        int aleatorio;
        for (int i = 0; i < m.length; i++) {
            for (int j = 0; j < m[0].length; j++) {
                aleatorio = rndm.nextInt(1, 100);
                m[i][j] = aleatorio;

                System.out.print(m[i][j] + "\t");

            }

            System.out.println("");
        }
    }

    public static void main(String[] args) {

        int MatrizNormal[][] = new int[4][5];
        int MatrizTraspuesta[][] = new int[5][4];

        Ejercicio_2_MatrizTraspuesta ej2 = new Ejercicio_2_MatrizTraspuesta();
        ej2.matNorm(MatrizNormal);
        System.out.println("----------------------");
        ej2.matNorm(MatrizTraspuesta);
    }

}
