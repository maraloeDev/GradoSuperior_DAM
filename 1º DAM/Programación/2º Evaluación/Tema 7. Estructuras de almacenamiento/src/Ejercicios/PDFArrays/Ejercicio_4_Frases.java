/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package Ejercicios.PDFArrays;

import java.util.Scanner;

/**
 *
 * @author Eduardo Martin - Sonseca
 */
public class Ejercicio_4_Frases {

    static String[] Frases = new String[5];
    static Scanner teclado = new Scanner(System.in);

    public static void imprimeFrases() {
        String msg = "";

        for (int i = 0; i < Frases.length; i++) {
            System.out.println("Introduce una frase");
            Frases[i] = teclado.nextLine();
            msg = msg + Frases[i] + "\n";
        }
        System.out.println("-----------------------");
        System.out.print(msg + "\n");
    }

    public static void mayorFrase() {
        int posicionMayor = 0;
        int mayor = 0;
        for (int i = 0; i < Frases.length; i++) {

            if (Frases[i].length() > mayor) {
                mayor = Frases[i].length();
                posicionMayor = i;

            }

        }
        System.out.println("La frase mas larga es " + Frases[posicionMayor] + " de longitud " + mayor + " y de posicion " + posicionMayor);
    }
    
    public static void menorFrase() {
        int posicionMenor = 0;
        int menor = 0;
        for (int i = 0; i < Frases.length; i++) {

            if (Frases[i].length() < menor) {
                menor = Frases[i].length();
                posicionMenor = i;

            }

        }
        System.out.println("La frase mas larga es " + Frases[posicionMenor] + " de longitud " + " y de posicion " + posicionMenor);
    }

    public static void main(String[] args) {
        
        
        imprimeFrases();
        mayorFrase();
        menorFrase();
    }

}
