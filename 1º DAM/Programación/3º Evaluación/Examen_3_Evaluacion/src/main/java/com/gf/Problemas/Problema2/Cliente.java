/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.Problema2;

/**
 *
 * @author maraloed
 */
public class Cliente {
    //Atributos
    private String nombre_cliente;
    private String cif_cliente;
    
    //Constructor
    public Cliente(String nombre_cliente, String cif_cliente) {
        this.nombre_cliente = nombre_cliente;
        this.cif_cliente = cif_cliente;
    }
    
    //Metodos Getter y Setter
    public String getNombre_cliente() {
        return nombre_cliente;
    }

    public void setNombre_cliente(String nombre_cliente) {
        this.nombre_cliente = nombre_cliente;
    }

    public String getCif_cliente() {
        return cif_cliente;
    }

    public void setCif_cliente(String cif_cliente) {
        this.cif_cliente = cif_cliente;
    }
    
    //Metodo toString

    @Override
    public String toString() {
        return "Cliente{" + "nombre_cliente=" + nombre_cliente + ", cif_cliente=" + cif_cliente + '}';
    }
    
    

}
