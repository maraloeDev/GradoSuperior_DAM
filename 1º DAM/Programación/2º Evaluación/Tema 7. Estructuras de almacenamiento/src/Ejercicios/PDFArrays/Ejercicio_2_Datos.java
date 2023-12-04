/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ejercicios.PDFArrays;

import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author Eduardo Martin - Sonseca
 */
public class Ejercicio_2_Datos {

    static Random rndm = new Random();

    public static void sumaPares() {

        int numeros[] = new int[10];
        int suma = 0;

        for (int i = 0; i < numeros.length; i = i + 2) { // Muestro los numeros del array de forma aleatoria, y lo sumo
            numeros[i] = rndm.nextInt(1, 10);
            System.out.println(numeros[i]);
            suma = suma + numeros[i];

        }
        System.out.println("La suma de los numeros pares es " + suma);
        System.out.println(Arrays.toString(numeros));
    }

    public static void main(String[] args) {
        sumaPares();

        System.out.println("Numeros con teclado");
        Scanner teclado = new Scanner(System.in);
        int numerosTeclado[] = new int[10];

        int suma2 = 0;
        for (int i = 0; i < numerosTeclado.length; i = i + 2) {
            System.out.println("Introduce un numero");

            numerosTeclado[i] = teclado.nextInt();

            suma2 = suma2 + numerosTeclado[i];
        }
        System.out.println("La suma de los numeros pares es " + suma2);

    }

}
