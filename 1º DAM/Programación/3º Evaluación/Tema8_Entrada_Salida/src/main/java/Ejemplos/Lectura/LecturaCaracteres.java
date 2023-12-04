/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Tema8;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFileChooser;

/**
 *
 * @author esgsanja
 * 
 * Leemos las frases del fichero 'frases.txt'
 */
public class LecturaCaracteres {
    public static void main(String[] args) {
        JFileChooser jfc=new JFileChooser("./src");
        jfc.setDialogTitle("Seleccione el fichero");
        jfc.setFileSelectionMode(JFileChooser.FILES_AND_DIRECTORIES);
        int respuesta=jfc.showOpenDialog(null);
        if(respuesta==JFileChooser.APPROVE_OPTION){
                File fichero=jfc.getSelectedFile();
                leerFrases(fichero);                       
        }
    }

    private static void leerFrases(File fichero) {
        try(BufferedReader br=new BufferedReader(new FileReader(fichero))){
            String frase="";
            while((frase=br.readLine())!=null){
                System.out.println("Frase:"+frase);
            }
            
            
        } catch (FileNotFoundException ex) {
            System.out.println("Fichero no encontrado");
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
    }
}
