/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package Ejemplos;

import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author maraloed
 */
public class EjemploCola {
    
    //Simulamos colas de impresion
    
    public static void main(String[] args) {
        String [] archivos = {"Archivo1.txt", "Archivo2.txt", "Archivo3.txt",
                              "Archivo4.txt", "Archivo5.txt", "Archivo6.txt"};
        
        LinkedList <String> colaImpresion = new LinkedList<>();
        
         for (String archivo : archivos) {
             colaImpresion.addLast(archivo);
            
        }
         
         System.out.println(colaImpresion);
         
         // Atendemos la cola de impresion
         
         //Mientras que la cola de impresion no esta vacia,
         
         while(!colaImpresion.isEmpty()){
            try {
                Thread.sleep(2000);
            } catch (InterruptedException ex) {
                Logger.getLogger(EjemploCola.class.getName()).log(Level.SEVERE, null, ex);
            }
             System.out.println("Imprimiendo " + colaImpresion.removeFirst());
         }
         System.out.println(colaImpresion);
    }
    
}
