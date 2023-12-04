/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package Ejercicios;

import javax.swing.JFileChooser;
import javax.swing.filechooser.FileFilter;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.filechooser.FileSystemView;

/**
 *
 * @author maraloed
 */
public class EjercicioPropuesto_3_LineasdeTexto {

    public static void main(String[] args) {
        /*Escribe un programa que muestre por pantalla las líneas de un archivo de
texto, numeradas*/

        JFileChooser jfc = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());
        jfc.setDialogTitle("Selecciona archivo");
        jfc.setMultiSelectionEnabled(true);
        jfc.showSaveDialog(null);
        jfc.setAcceptAllFileFilterUsed(true);
        FileNameExtensionFilter filtro = new FileNameExtensionFilter("Ficheros de texto", "txt"); // Crear filtro    
        jfc.addChoosableFileFilter(filtro);
        
        
        

    }

}
