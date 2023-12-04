/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ejemplos.ClaseFile;

import javax.swing.JFileChooser;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.filechooser.FileSystemView;

/**
 *
 * @author marti
 */
public class HacerFiltro {
    public static void main(String[] args) {
        
    JFileChooser jfc = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());
    jfc.setDialogTitle("Realización de filtros");
    
    jfc.setAcceptAllFileFilterUsed(true);
        FileNameExtensionFilter filtro = new FileNameExtensionFilter("Ficheros de texto", "txt"); // Crear filtro    
        jfc.addChoosableFileFilter(filtro);
        int respuesta = jfc.showOpenDialog(null);
        if (respuesta == JFileChooser.APPROVE_OPTION) {
            if(jfc.getSelectedFile().isFile()){
                
                System.out.println("Has seleccionado el fichero de texto " + jfc.getSelectedFile().getAbsolutePath());
                
            }
            
        }
    }
    
}
