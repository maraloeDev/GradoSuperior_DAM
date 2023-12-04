/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Problema1;

import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author maraloed
 */
public class Loteria {

    static Random rndm = new Random();
    static int[] numeroLoterias = new int[6];
    static Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        String opcion;
        do {
            apuestas();
            apuestasOrdenadas();

            System.out.println("Desea generar otra apuesta.");
            opcion = scanner.nextLine();

            if (opcion.equalsIgnoreCase("N")) {
                System.out.println("has salido");
            }
        } while (opcion.equalsIgnoreCase("S"));
    }

    public static void apuestas() {

        // Array con numeros aleatorios entre 1 y 49 con el objeto Random.

        /*Recorro un bucle for con el array, pero dando valor a i
            es decir, poner en cada vuelta de bucle, un numero aleatorio.*/
        for (int i = 0; i < numeroLoterias.length; i++) {
            numeroLoterias[i] = rndm.nextInt(1, 49);
        }
        System.out.println("APUESTAS DE LA LOTERIA PRIMITIVA");
        System.out.println("-------------------------------------");
        System.out.println(Arrays.toString(numeroLoterias));
    }

    public static void apuestasOrdenadas() {

        System.out.println("ORDENANDO APUESTAS");
        System.out.println("-------------------------------------");

        // Ordeno las apuestas con Arrays.sort() y lo imprimo con toString
        Arrays.sort(numeroLoterias);
        System.out.println(Arrays.toString(numeroLoterias));
    }

}
