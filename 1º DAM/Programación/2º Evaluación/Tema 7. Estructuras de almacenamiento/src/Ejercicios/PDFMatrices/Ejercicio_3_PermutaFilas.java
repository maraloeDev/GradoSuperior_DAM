/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ejercicios.PDFMatrices;

import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author Eduardo Martin - Sonseca
 */
public class Ejercicio_3_PermutaFilas {
    static Random rndm = new Random();
    
    public static void main(String[] args) {
        Scanner teclado = new Scanner (System.in);
        
        System.out.println("Introduzca el valor de filas");
        int dimensionF = teclado.nextInt();
        
        System.out.println("Introduzca el valor de filas");
        int dimensionC = teclado.nextInt();
        
         int[][] numerosPer = new int[dimensionF][dimensionC];
         for (int i = 0; i < dimensionF; i++) {
             for (int j = 0; j < dimensionC; j++) {
                 numerosPer[i][j]= rndm.nextInt(1, 100);
             System.out.println(numerosPer[i][j] + "\t");
                 
             }
             System.out.println("");
        }
         
         System.out.println("-----------");
         permutaFilas(numerosPer,dimensionF, dimensionC);
         System.out.println("-----------------------------");
         permutaColumnas(numerosPer);
    }
    public static void  permutaFilas(int [][] m, int fila1, int fila2){
        
        int n;
        for (int i = 0; i < m.length-1; i++) {
            for (int j = 0; j < m.length-1; j++) {

                System.out.print((m[i][j] + "\t"));
                
            }
            
        System.out.println("");
        }
        
            
        }
        public static void permutaColumnas(int [][] m){
            
            int n;
            for (int i = 0; i < m.length-1; i++) {
                for (int j = 0; j < m.length-1; j++) {
            n=rndm.nextInt(1, 100);
                    System.out.print(m[i][j] + "\t");
                    
                }
                System.out.println("");
                
            }
        
    }
    
}
