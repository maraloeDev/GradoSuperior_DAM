
package Ejemplos.Escritura;

import javax.swing.*;
import javax.swing.filechooser.FileSystemView;
import java.io.*;
import java.util.Random;
import java.util.Scanner;

public class EscrituraBinaria {

    //Escrivura binaria 1 :
    //Vamos a utulizar el objeto DataOutPutStream para hacer la escritura

    //Escritura binaria 2 :
    //Vamos a utilizar el objeto FileOutputStream

    /* Almacenamos en un fichero binarios 'Datos.bat' generando aleatorios*/

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

        File fichero = new File(carpeta, "Datos.bat");
        Random rndm = new Random();

        //Va de forma secuencial, primero se crea, luego
        FileOutputStream fileOutputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        DataOutputStream dataOutputStream = new DataOutputStream(bufferedOutputStream);
        try {
            fileOutputStream =new FileOutputStream(fichero);
            bufferedOutputStream = new BufferedOutputStream(fileOutputStream);
            dataOutputStream = new DataOutputStream(bufferedOutputStream);

            for (int i = 0; i < 10; i++) {
                int aleatorio = rndm.nextInt(1, 10);
                dataOutputStream.write(aleatorio);

            }
            dataOutputStream.close();

        } catch (IOException ex) {

            System.out.println(ex.getMessage());

        } finally {

        }
    }
}