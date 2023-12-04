/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ejercicios;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Scanner;


/**
 *
 * @author Eduardo Martin-Sonseca
 *
 *
 * Escribe un programa que muestre el contenido de un directorio con un formato
 * similar al del comando dir de MS-DOS. La ruta al archivo será introducida por
 * teclado
 *
 */
public class EjercicioPropuesto_1_DIR {

    static Scanner teclado = new Scanner(System.in);

    public static void main(String[] args) {

        System.out.println("Introduce una ruta (Ejemplo : C:\\Users\\marti\\OneDrive\\Grado-Superior-DAM)");

        String ruta = teclado.next();
            int totalArchivos=0;
            int totalDirectorios=0;

        File f = new File(ruta);
        for (File files : f.listFiles()) { // Creacion de nueva variable, que coge toda la lista de archivos

            if (files.isDirectory()) {
                
                long fecha = files.lastModified();
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm");
                System.out.println(sdf.format(fecha) + "\t" + " <DIR> " + "\t" + files.getName());
                
                totalDirectorios++;
            } else if (files.isFile()) {
                long fecha = files.lastModified();
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm");

                System.out.println(sdf.format(fecha) + "\t" + "\t" + files.length() + "bytes " + files.getName());
                totalArchivos++;
            }

        }
        System.out.println(totalArchivos + " archivos" );
        System.out.println(totalDirectorios + " dirs");    }

}
