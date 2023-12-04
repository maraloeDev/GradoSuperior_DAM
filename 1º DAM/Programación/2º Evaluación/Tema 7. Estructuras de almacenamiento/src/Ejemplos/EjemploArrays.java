/*
 * * *****************************************************************************
 *  * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 *  *****************************************************************************
 */

package Ejemplos;

public class EjemploArrays {

    public static void main(String[] args) {
/*
        int[][] numeros = new int[3][3];

        //Recorrer filas
        for (int i = 0; i < numeros.length; i++) {
        //Sirve para poner una separacion

            System.out.println();
            //recorrer columnas
            for (int j = 0; j < numeros.length; j++) {
                //Imprime el valor de la matriz
                System.out.print(numeros[i][j] + " ");

            }
        }*/

        int [][]matriz = new int[2][2];
        matriz[0][0] = 45;
        matriz[0][1] = 4;
        matriz[1][0] = 78;
        matriz[1][1] = 65;

        for (int i = 0; i < matriz.length; i++) {
            System.out.println();
            for (int j = 0; j < matriz.length; j++) {
                System.out.print(matriz[i][j] + " ");
            }
            
        }
    }
}
