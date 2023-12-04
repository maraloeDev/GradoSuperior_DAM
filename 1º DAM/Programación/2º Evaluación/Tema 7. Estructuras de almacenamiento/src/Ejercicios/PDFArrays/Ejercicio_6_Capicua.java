/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package Ejercicios.PDFArrays;


import java.util.Scanner;

/**
 *
 * @author Eduardo Martin - Sonseca
 *
 * Crea un programa Capicua que compruebe si un número es capicúa utilizando un
 * array
 */
public class Ejercicio_6_Capicua {

    static Scanner teclado = new Scanner(System.in);

    public static void main(String[] args) {
        System.out.println("Introduce un numero");
        int capicua = teclado.nextInt();
        int auxiliar = capicua;
        int[] esCapicua = new int[capicua];
        int cifras = 0;
        int inverso = 0;
        while (auxiliar > 0) {

            cifras = auxiliar % 10;
            inverso = inverso * 10 + cifras;

            auxiliar = auxiliar / 10;

        }

        if (capicua == inverso) {
            System.out.println("Es capicua");
        } else {
            System.out.println("No es capicua");
        }

    }
}
