package Ejemplos.Lectura;

import javax.swing.*;
import javax.swing.filechooser.FileSystemView;
import java.io.File;

public class LecturaBinaria2 {

    public static void main(String[] args) {

        JFileChooser jFileChooser = new JFileChooser(FileSystemView.getFileSystemView());

        jFileChooser.setDialogTitle(null);
        jFileChooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);

        int resp = jFileChooser.showOpenDialog(null);

        if (resp == JFileChooser.APPROVE_OPTION) {

            File directorio = jFileChooser.getSelectedFile();
            leerDatos(directorio);

        }

}
public static void leerDatos(File fichero){
        

        }
    }
