/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ejemplos.ClaseFile;

import java.io.File;
import javax.swing.JFileChooser;
import javax.swing.filechooser.FileSystemView;

/**
 *
 * @author Eduardo
 */
public class EjemploJfc3 {

    public static void main(String[] args) {

        JFileChooser jfc = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());
        jfc.setFileSelectionMode(JFileChooser.FILES_AND_DIRECTORIES);
        jfc.setMultiSelectionEnabled(true); // Si acepta el 

        int respuesta = jfc.showOpenDialog(null);

        if (respuesta == JFileChooser.APPROVE_OPTION) {
            File [] objetosSelect = jfc.getSelectedFiles(); //Se guarda en una variable de tipo File, el archivo seleccionado
            
            System.out.println("DIRECTORIOS");
            
            for(File f : objetosSelect){
                if(f.isDirectory()){
                    System.out.println(f.getName());
                }
            }
            
            System.out.println("ARCHIVOS");
            for(File f : objetosSelect){
                if(f.isFile()){
                    System.out.println(f.getName());
                }
            }
        }

    }
}
