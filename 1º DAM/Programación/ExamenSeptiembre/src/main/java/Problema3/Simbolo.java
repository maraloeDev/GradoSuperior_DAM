/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Problema3;

import java.awt.Color;

/**
 *
 * @author maraloed
 */
public class Simbolo {
    
    private String nombre;
    private char caracterAsociado;
    private int ascii;
    private Color color;

    public Simbolo(String nombre, char caracterAsociado, int ascii, Color color) {
        this.nombre = nombre;
        this.caracterAsociado = caracterAsociado;
        this.ascii = ascii;
        this.color = color;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public char getCaracterAsociado() {
        return caracterAsociado;
    }

    public void setCaracterAsociado(char caracterAsociado) {
        this.caracterAsociado = caracterAsociado;
    }

    public int getAscii() {
        return ascii;
    }

    public void setAscii(int ascii) {
        this.ascii = ascii;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    @Override
    public String toString() {
        return "Simbolo{" + "nombre=" + nombre + ", caracterAsociado=" + caracterAsociado + ", ascii=" + ascii + ", color=" + color + '}';
    }
    
    
    
}
