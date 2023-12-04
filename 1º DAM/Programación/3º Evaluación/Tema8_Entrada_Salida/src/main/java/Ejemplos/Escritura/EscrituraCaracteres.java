/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ejemplos.Escritura;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;
import javax.swing.JFileChooser;

/**
 *
 * @author
 *
 * Escritura texto: objeto BufferedWriter Grabamos frases introducidas por
 * teclado en el fichero 'frases.txt'
 */
public class EscrituraCaracteres {

    static Scanner sc = new Scanner(System.in);

    public static void main(String[] args) {
        JFileChooser jfc = new JFileChooser("./src");
        jfc.setDialogTitle("Seleccione el directorio donde guardar el archivo");
        jfc.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
        int respuesta = jfc.showOpenDialog(null);
        if (respuesta == JFileChooser.APPROVE_OPTION) {
            File directorio = jfc.getSelectedFile();
            escribirFrases(directorio);
        }
    }

    private static void escribirFrases(File carpeta) {

        File fichero = new File(carpeta, "frases.txt");

        try ( BufferedWriter bw = new BufferedWriter(new FileWriter(fichero, true))) {
            String frase = "";
            do {
                System.out.println("Introduce frase: ");
                frase = sc.nextLine();
                if (frase.length() > 0) {
                    bw.write(frase);
                    bw.newLine();
                }
            } while (frase.length() > 0);
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
    }
}
