/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */

package Ejercicio_4;

public class Calculadora{
    /*Introduccion de datos mediante metodos para la calculadora estandar */
    public static String sumarNumeros(double numero1,double numero2) {
        String resultado = String.valueOf(numero1 + numero2);
        
        return resultado;
    }
    
    public static String restarNumeros(double numero1,double numero2) {
        String resultado = String.valueOf(numero1 - numero2);
        
        return resultado;
    }
    
    public static String multiplicarNumeros(double numero1,double numero2) {
        String resultado = String.valueOf(numero1 * numero2);
        
        return resultado;
    }
    
    public static String dividirNumeros(double numero1,double numero2) {
        String resultado = String.valueOf(numero1 / numero2);
        
        return resultado;
    }
    
    /*Introduccion de datos mediante metodos para la calculadora cientifica*/

    
    public static String logaritmoNumeros(double numero1) {
        String resultado = String.valueOf(Math.log(numero1));
        
        return resultado;
    }
    
    public static String senoNumeros(double numero1) {
        String resultado = String.valueOf(Math.toRadians(numero1));
        return resultado;
    }
    
    public static String cosenoNumeros(double numero1) {
        String resultado = String.valueOf(Math.toRadians(numero1));
        return resultado;
    }
    
    public static String tangenteNumeros(double numero1) {
        String resultado = String.valueOf(Math.toRadians(numero1));
        return resultado;
    }
    
    public static String raizCuadradaNumeros(double numero1) {
        String resultado = String.valueOf(Math.sqrt(numero1));
        return resultado;
    }
    
    public static String elevadoNumeros(double numero1) {
        String resultado = String.valueOf(Math.pow(numero1, 2));
        return resultado;
    }

}
