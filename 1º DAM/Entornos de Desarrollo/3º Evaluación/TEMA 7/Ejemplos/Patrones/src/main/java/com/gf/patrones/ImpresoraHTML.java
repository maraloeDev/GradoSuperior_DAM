/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gf.app.patrones;

/**
 *
 * @author garrodlu
 */
public class ImpresoraHTML extends Impresora{
     public ImpresoraHTML(String texto) {
        setTexto(texto);
    }

    @Override
    public void imprimir() {
        System.out.println("Fichero HTML con " +getTexto());
    }
  
}
