/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ejercicios;

import java.io.File;
import java.util.Arrays;
import java.util.Scanner;
/**
 *
 * @author Eduardo Martin-Sonseca
 *
 *
 * Escribe un programa que muestre recursivamente el contenido de un directorio.
 * La visualización por consola deberá ser similar al que aparece al ejecutar el
 * comando tree de MS-DOS. La ruta al archivo será introducida por teclado.
 */
public class EjercicioPropuesto_2_Tree {

    static Scanner teclado = new Scanner(System.in);

    public static void main(String[] args) {
        System.out.println("Introduce una ruta ");
        String ruta = teclado.next();
        File f = new File(ruta);

        System.out.println("----------------------");
        do {

            System.out.println("Listado de rutas de carpetas");
            System.out.println(f.getName());
            if (f.isDirectory() || f.isFile()) {
                String [] contenido = f.list();
                System.out.println(Arrays.toString(contenido));
            }


        } while (f == null);
    }

}