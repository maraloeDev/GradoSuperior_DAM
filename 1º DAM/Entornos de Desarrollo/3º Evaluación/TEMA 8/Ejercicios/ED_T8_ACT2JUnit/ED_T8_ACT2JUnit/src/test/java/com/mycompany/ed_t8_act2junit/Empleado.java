/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ed_t8_act2junit;

/**
 *
 * @author Eduardo
 */
public class Empleado {
    //Constantes
    
    /**
     * Constante SALARIO_DEF
     */
    
    public final static double SALARIO_DEF=600;
    
    /**
     * Indica que la edad de un empleado es mayor que otro
     */
    public final static int MAYOR=1;
    
    /**
     * Indica que la edad de un empleado son iguales
     */
    
    public final static int IGUAL=1;
    
    /**
     * Indica que la edad de un empleado es menor que el otro
     */
    
    public final static int MENOR=1;
    
    //Atributos
    
    /**
     * Nombre del empleado
     */
    private String nombre;
    /**
     * Apellido del empleado
     */
    private String apellido;
    /**
     * Edad del empleado
     */
    private String edad;
    /**
     * Salario del empleado
     */
    private String salario;

    /**
     * Devuelve el nombre del empleado
     * @return nombre del empleado
     */
    public String getNombre() {
        return nombre;
    }
    /**
     * Devuelve el apellido del empleado
     * @return apellido del empleado
     */

    public String getApellido() {
        return apellido;
    }
    /**
     * Devuelve el edad del empleado
     * @return edad del empleado
     */
    public String getEdad() {
        return edad;
    }
    /**
     * Devuelve el salario del empleado
     * @return salario del empleado
     */
    public String getSalario() {
        return salario;
    }
    /**
     * Suma un plus si el empleado tiene mas de 40 años
     * @param sueldoPlus
     * @return true si se realiza y false si no se realiza
     */
    public boolean plus(double sueldoPlus){
        boolean aumento=false;
        if(edad > 40){
            salario+=sueldoPlus;
            aumento=true;
        }
        return aumento;
    }
    
    /**
     * Indica si dos empleados son iguales segun su nombre y apellido
     * @param a empleado a comparar
     * @return true si son iguales y false si no lo son
     */
    
    public boolean equals(Empleado a){
        if(a.getNombre().equals(nombre) && a.getApellido().equals(apellido)){
            return true;
        } else{
            return false;
        }
        
        /**
     * Indica si un empleado es mayor o iguak o menor que otro segun la edad
     * @param a empleado a comparar
     * @return 1: mayor, 0:iguales y -1  menor que el empleado comparado
     */
        public int compareTo(Empleado a){
            int estado=MENOR;
        }
    }
    
    
    
    
    
}
