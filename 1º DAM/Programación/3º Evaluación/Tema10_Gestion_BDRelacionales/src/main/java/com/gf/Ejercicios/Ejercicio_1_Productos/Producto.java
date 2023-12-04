package com.gf.Ejercicios.Ejercicio_1_Productos;



public class Producto {

    private int codigo;
    private String tipo;
    private String descripcion;
    private double precio;
    private int cantidad;

    public Producto(int codigo, String tipo, String descripcion,
            double precio, int cantidad) {
        this.tipo = tipo;
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.precio = precio;
        this.cantidad = cantidad;
    }

    public int getCodigo() {
        return codigo;
    }

    public String getTipo() {
        return tipo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    @Override
    public String toString() {
        return codigo + ": " + descripcion + " --> " + precio + " €";
    }

}
