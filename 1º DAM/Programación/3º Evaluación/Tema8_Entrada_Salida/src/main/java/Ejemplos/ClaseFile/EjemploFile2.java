/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package Ejemplos.ClaseFile;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author maraloed
 */

/*Solicitar al usuario una ruta a un directorio

    Si existe mostrar el numero de subdirectorios y el numero de archivos
    que tiene, y si no tiene, crearlo

    Solicitar al usuario una ruta a un archivo, si existe mostrar su tamanio y si no existe, crearle */
public class EjemploFile2 {

    public static void parte1() {
        Scanner sc = new Scanner(System.in);

        System.out.println("Introduce ruta");
        String ruta = sc.nextLine();

        File f = new File(ruta);

        if (f.exists() && f.isDirectory()) {
            System.out.println("La carpeta se ha creado");
            int contadorCarpetas = 0;
            int contadorDirectorios = 0;
            for (File file : f.listFiles()) {
                if (file.isFile()) {
                    contadorCarpetas++;
                } else if (f.isDirectory()) {
                    contadorDirectorios++;

                }
            }
            System.out.println("Hay " + contadorCarpetas + " carpetas");
            System.out.println("Hay " + contadorDirectorios + " directorios");
        }
    }

    public static void parte2() {

        Scanner sc = new Scanner(System.in);

        System.out.println("Introduce ruta");
        String ruta = sc.nextLine();

        File f = new File(ruta);

        if (f.exists() && f.isFile()) {
            double kb = f.length() / 1024;
            System.out.println("Tamanio en KiloBytes " + kb);
        } else {

            try {
                if (f.createNewFile()) {
                    System.out.println("Archivo creado");
                }
            } catch (IOException ex) {
                Logger.getLogger(EjemploFile2.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

    public static void getUnidades() {
        File[] unidades = File.listRoots();
        //for (File unidad : unidades) {
            System.out.println("\t " + Arrays.toString(unidades));
        //}
    }

    public static void archivoTemporal() {
        try {
            File temporal = File.createTempFile("Prueba", null);

            System.out.println(temporal.getAbsolutePath()); //Ruta entera del archivo temp
            temporal.delete();
            System.out.println(temporal.getAbsolutePath());
        } catch (IOException ex) {
            Logger.getLogger(EjemploFile2.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        //parte1();
        parte2();
        getUnidades();
        archivoTemporal();
    }

}
