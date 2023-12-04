package Ejemplos.Escritura;

import javax.swing.*;
import javax.swing.filechooser.FileSystemView;
import java.io.*;
import java.util.Random;

public class EscrituraBinaria2 {

    public static void main(String[] args) {

        JFileChooser jFileChooser = new JFileChooser(FileSystemView.getFileSystemView());

        jFileChooser.setDialogTitle(null);
        jFileChooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);

        int resp = jFileChooser.showOpenDialog(null);

        if (resp == JFileChooser.APPROVE_OPTION) {

            File directorio = jFileChooser.getSelectedFile();
            escribirDatos(directorio);

        }
    }

    public static void escribirDatos(File carpeta) {

        File fichero = new File(carpeta, "mensaje.bat");
        Random rndm = new Random();

        //Va de forma secuencial, primero se crea, luego
        FileOutputStream fileOutputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        DataOutputStream dataOutputStream = new DataOutputStream(bufferedOutputStream);
        try {
            fileOutputStream = new FileOutputStream(fichero);
            bufferedOutputStream = new BufferedOutputStream(fileOutputStream);
            dataOutputStream = new DataOutputStream(bufferedOutputStream);

           String msg = "Desarrollo de Aplicaciones Multiplataforma";
           for (char caracter : msg.toCharArray());

        } catch (IOException ex) {

            System.out.println(ex.getMessage());

        } finally {

        }
    }
}
