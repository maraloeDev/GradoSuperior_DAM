/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package TeatroRecuperacion;

import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author Eduardo Martín-Sonseca
 */
public class AppTeatro {

    static String ANSI_RED = "\u001B[31m"; //Cambiar el color a rojo la butaca cuando se haga la reserva
    static String ANSI_GREEN = "\u001B[32m"; //Cambiar el color a verde la butaca cuando este libre
    static Scanner teclado = new Scanner(System.in);
    static Random rndm = new Random();

    static PatioButacas pb = new PatioButacas();
    static Reserva reserva = new Reserva();
    static double precio = 10;

    public static void main(String[] args) {

        pb.iniciarteatro();
        pb.mostrarteatro();

        int opcion = 0;
        while (opcion != 4) {
            System.out.println("Introduzca una opcion:" + "\n"
                    + "1: Reserva automatica" + "\n"
                    + "2: Reserva manual" + "\n"
                    + "3: Ver Reserva" + "\n"
                    + "4: Salir");

            opcion = teclado.nextInt();
            switch (opcion) {
                case 1:
                    reserva.reservaauto();
                    reserva.verreserva();
                    break;
                case 2:
                    reserva.reservamanual();
                    break;
                case 3:
                    reserva.verreserva();
                    break;
                case 4:
                    System.exit(0);
                    break;
                default:
                    System.out.println("Opcion no valida");
            }
        }
        System.out.println("\u001B[0m");/*reseteo al color original por defecto*/

    }

}
