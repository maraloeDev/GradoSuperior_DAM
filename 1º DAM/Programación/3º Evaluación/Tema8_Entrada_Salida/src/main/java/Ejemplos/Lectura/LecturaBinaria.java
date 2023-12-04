package Ejemplos.Lectura;

import javax.swing.*;
import javax.swing.filechooser.FileSystemView;
import java.io.*;

public class LecturaBinaria {

    public static void main(String[] args) throws IOException {
        JFileChooser jFileChooser = new JFileChooser(FileSystemView.getFileSystemView());

        jFileChooser.setDialogTitle(null);
        jFileChooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);

        int resp = jFileChooser.showOpenDialog(null);

        if (resp == JFileChooser.APPROVE_OPTION) {

            File directorio = jFileChooser.getSelectedFile();
            leerDatos(directorio);

        }
    }

    public static void leerDatos(File fichero) throws IOException {

        //Va de forma secuencial, primero se crea, luego
        FileInputStream fileInputStreamStream;
        BufferedInputStream bufferedInputStream;
        DataInputStream dataInputStream;

            boolean eof=false;
        try {
            fileInputStreamStream = new FileInputStream(fichero);
            bufferedInputStream = new BufferedInputStream(fileInputStreamStream);
            dataInputStream = new DataInputStream(bufferedInputStream);
            while (!eof){
                int num = dataInputStream.readInt();
                System.out.println(num);

            }


        } catch (EOFException | FileNotFoundException ex) {

            System.out.println(ex.getMessage());

        } finally {

        }
    }
}
