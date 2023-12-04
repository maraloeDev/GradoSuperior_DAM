/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package TeatroRecuperacion;

import static TeatroRecuperacion.AppTeatro.ANSI_GREEN;
import static TeatroRecuperacion.AppTeatro.ANSI_RED;

/**
 *
 * @author Eduardo Martín-Sonseca
 */
public class PatioButacas {

    static Butaca butacaReservada[][][] = new Butaca[2][9][8]; //Matriz tridimensional de objeto butaca
        

    public  void iniciarteatro() { //Inicia el teatro de forma normal
        for (int i = 0; i < 2; i++) { //Profundidad
            for (int j = 0; j < 9; j++) {// Fila
                for (int k = 0; k < 8; k++) { //Columna
                    butacaReservada[i][j][k] = new Butaca("00000", false, j + 1, k + 1); //Creo un objeto de matriz butaca, y establezco atributos
                }
            }
            System.out.print("\t\t\t");
        }
    }

    public  void mostrarteatro() {
        System.out.println("ZONA 1\t\t\t\t\t\t\t\t\tZONA 2");
        for (int j = 0; j < 9; j++) { //Fila
            for (int i = 0; i < 2; i++) { //Columna
                for (int k = 0; k < 8; k++) {//Columna

                    //Si la butaca, esta reservada, 
                    if (butacaReservada[i][j][k].ocupado == false) {
                        System.out.print(ANSI_GREEN + "F" + (j + 1) + "A" + (k + 1) + "\t"); //
                    } else {
                        System.out.print(ANSI_RED + "F" + (j + 1) + "A" + (k + 1) + "\t");
                    }
                }
                System.out.print("\t\t\t"); //Genero espacios (en este caso tabuladores), para separar la z1 y z2
            }
            System.out.println("\u001B[0m"); //Hace el salto de linea, y vuelve al color original (negro)

        }
    }
}
