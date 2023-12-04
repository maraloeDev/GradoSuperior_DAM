/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Problema1;

import java.util.ArrayList;

/**
 *
 * @author Eduardo Martin - Sonseca
 */
public class Polinomio {

    //Atributos
    private Integer grado;
    private ArrayList coeficientes;

    //constructor por defecto
    public Polinomio() {
        this.grado = 0;
    }

    //Constructor normal
    public Polinomio(int grado, ArrayList coeficientes) {
        this.grado = grado;
        this.coeficientes = coeficientes;
    }

    public ArrayList getCoeficientes() {
        return coeficientes;
    }

    public void setCoeficientes(ArrayList coeficientes) {
        this.coeficientes = coeficientes;
    }

    @Override
    public String toString() {
        return "Polinomio{" + "grado=" + grado + ", coeficientes=" + coeficientes + '}';
    }

    public static void getCoeficiente(int i) {

    }

}
