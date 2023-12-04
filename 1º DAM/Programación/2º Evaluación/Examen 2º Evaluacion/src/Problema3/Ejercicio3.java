package Problema3;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Eduardo Martin - Sonseca
 */
public class Ejercicio3 {

    public static void main(String[] args) {
        String[] categorias = {"A", "B", "C", "W"};

        String[] lista = {"ABART 20", "CDXEF 50", "BKWRK 25", "BTSQZ 89", "DRTYM 60"};
        
        for (String categoria : categorias) {
            int suma = 0;
            for (String lista1 : lista) {
                if (categoria.equals(lista1.substring(0, 1))) {
                    suma = suma + Integer.parseInt(lista1.substring(lista1.length() - 2, lista1.length()));
                }
            }
            System.out.println(categoria + ": " + suma);
        }
        
        

    }

}
