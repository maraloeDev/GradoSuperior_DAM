/*
 * * *****************************************************************************
 *  * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 *  *****************************************************************************
 */

package Ejercicios.PDFMatrices;

import java.util.Random;

public class Ejercicio_1_Matriz1 {

    static int[][] numeros = new int[5][5];
    static Random rndm = new Random();

    public static void main(String[] args) {
        Ejercicio_1_Matriz1 ejercicio1 = new Ejercicio_1_Matriz1();

        for (int i = 0; i < numeros.length; i++) { //CuentaFilas
            for (int j = 0; j < numeros[0].length; j++) {//CuentaColumnas
                if (i % 2 == 0) {
                    numeros[i][j] = rndm.nextInt(1, 10) * 2;
                } else {
                    numeros[i][j] = rndm.nextInt(1, 10) * 3;
                }
                System.out.print(numeros[i][j] + "\t");
            }
            System.out.println("");
        }

        System.out.println("-----------------------------------");

        System.out.println("MATRIZ IMPRESA");
        ejercicio1.imprimirMartiz();

        System.out.println("-----------------------------------");

        System.out.println("SUMA DE MATRIZ");
        ejercicio1.sumaMatriz();

        System.out.println("-----------------------------------");

        System.out.println("DIAGONAL DE LA MATRIZ");
        ejercicio1.diagonal();


    }

    public void imprimirMartiz() {

        for (int i = 0; i < numeros.length; i++) {

            for (int j = 0; j < numeros[0].length; j++) {

                System.out.print(numeros[i][j] + "\t");
            }
        System.out.println();
        }
    }

    public void sumaMatriz() {
        int suma = 0;
        for (int i = 0; i < numeros.length; i++) {
            for (int j = 0; j < numeros[0].length; j++) {
                suma += numeros[i][j];
            }
        }
        System.out.println("La suma de todos los elementos de la matriz es de " + suma);
    }

    public void diagonal(){

        for (int i = 0; i < numeros.length; i++) {
            for (int j = 0; j < numeros[i].length; j++) {

                if (i == j) {
                    System.out.print(numeros[i][j]);
                } else {
                    System.out.print("\t");
                }

            }
            System.out.println("");

        }
    }
}