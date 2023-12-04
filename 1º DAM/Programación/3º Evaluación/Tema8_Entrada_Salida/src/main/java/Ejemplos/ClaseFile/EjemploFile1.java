/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package Ejemplos.ClaseFile;

import java.io.File;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.Scanner;

/**
 *
 * @author maraloed
 */
public class EjemploFile1 {
    

static Scanner sc = new Scanner(System.in);
    public static void main(String[] args) {
        
        System.out.println("Introduce ruta");
        String ruta = sc.nextLine();
        
        File f = new File(ruta); // El objeto file no comprueba existencia
        
        if (f.isDirectory()) {
            System.out.println("Carpeta existente");
            System.out.println("Contenido...");
            String[] contenido = f.list(); // Sirve para ver el contenido
            System.out.println(Arrays.toString(contenido));
        } else if (f.isFile()){
            
            System.out.println("Archivo  existente");
            System.out.println("El tamanio es de " + f.length() + " bytes");
            long millis = f.lastModified();
            LocalDate fecha = LocalDate.ofEpochDay(millis);
            System.out.println("Fecha " +  fecha);
        }
    }

}
