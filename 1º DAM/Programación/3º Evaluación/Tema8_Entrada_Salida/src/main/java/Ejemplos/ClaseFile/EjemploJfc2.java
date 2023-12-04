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
public class EjemploJfc2 {

    public static void main(String[] args) {

        // JFileChooser jfc = new JFileChooser();
        // JFileChooser jfc = new JFileChooser(currentDirectory); Se le puede pasar por parametro un objeto File
        // JFileChooser jfc = new JFileChooser(currentDirectoryPath)Se le puede pasar por parametro una cadena Con la ruta al directorio
        //Sirve para que se situe en el directorio principal del sistema 
        JFileChooser jfc = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());
//jfc.showSaveDialog(null); // Sirve para guardar un archivo

        int respuesta = jfc.showOpenDialog(null);

        if (respuesta == JFileChooser.APPROVE_OPTION) {
            File ficheroSelect = jfc.getSelectedFile(); //Se guarga en una variable de tipo File, el archivo seleccionado

            System.out.println(ficheroSelect.getAbsolutePath());
        }

    }
}
