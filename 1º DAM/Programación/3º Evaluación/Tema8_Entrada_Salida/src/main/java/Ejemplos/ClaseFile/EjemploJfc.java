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
public class EjemploJfc {

    public static void main(String[] args) {

        JFileChooser jfc = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());

        jfc.setDialogTitle("Elije el directorio donde guardar tu archivo : ");
        jfc.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY); //Que solamente seleccione directorios
        int respuesta = jfc.showSaveDialog(null);

        if (respuesta == JFileChooser.APPROVE_OPTION) {
            
            if (jfc.getSelectedFile().isDirectory()){
                
                System.out.println("Has seleccionado el directorio " + jfc.getSelectedFile());
            }
        }

    }
}
