package com.gf.Ejercicios.Ejercicio_1_Productos;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



public class TipoProducto {
    
    private int idTipo;
    private String tipo;

    public TipoProducto(int idTipo, String tipo) {
        this.idTipo = idTipo;
        this.tipo = tipo;
    }

    public int getIdTipo() {
        return idTipo;
    }

    public String getTipo() {
        return tipo;
    }  

    @Override
    public String toString() {
        return tipo;
    }
        
}
