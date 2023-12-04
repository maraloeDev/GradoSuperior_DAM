/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ejercicios.PDFArrays;

import java.util.Scanner;

/**
 *
 * @author Eduardo Martin - Sonseca
 */
public class Ejercicio_1_Personas {

    static String[] nombres = new String[20];
    static Scanner teclado = new Scanner(System.in);

    public static void imprimePersonas() {

        String msg = "";
        for (int i = 0; i < nombres.length; i++) {
            System.out.println("Introduce un nombre ");
            nombres[i] = teclado.next();
            msg = msg + nombres[i] + "\n";

        }

        System.out.println("--------------");
        System.out.println(msg);

    }

    public static void pares() {
        for (int i = 0; i < nombres.length; i = i + 2) {

            System.out.println(nombres[i]);

        }
    }

    public static void main(String[] args) {

        imprimePersonas();
        pares();

    }

}
