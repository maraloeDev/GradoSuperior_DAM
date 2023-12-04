package Problema2;


import java.util.Scanner;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Eduardo Martin - Sonseca
 */
public class Cuenta {
    
    static Scanner teclado = new Scanner(System.in);
    //Atributos
    private String numero_cuenta;
    private double saldo_cuenta;
    private double comision_cuenta;

    public Cuenta(String numero_cuenta, double saldo_cuenta, double comision_cuenta) {
        this.numero_cuenta = numero_cuenta;
        this.saldo_cuenta = saldo_cuenta;
        this.comision_cuenta = comision_cuenta;
    }
    public Cuenta(){
        
    }

    public String getNumero_cuenta() {
        return numero_cuenta;
    }

    public void setNumero_cuenta(String numero_cuenta) {
        this.numero_cuenta = numero_cuenta;
    }

    public double getSaldo_cuenta() {
        return saldo_cuenta;
    }

    public void setSaldo_cuenta(double saldo_cuenta) {
        this.saldo_cuenta = saldo_cuenta;
    }

    public double getComision_cuenta() {
        return comision_cuenta;
    }

    public void setComision_cuenta(double comision_cuenta) {
        this.comision_cuenta = comision_cuenta;
    }

    @Override
    public String toString() {
        return "CUENTA{" + "numero_cuenta=" + numero_cuenta + ", saldo_cuenta=" + saldo_cuenta + ", comision_cuenta=" + comision_cuenta + '}';
    }
    
    //Metodos
    
    public  String ingresarDinero(){
        
        System.out.println("Ingrese dinero : ");
        double ingreso =teclado.nextDouble();
        
        //Variable saldo en la que se suma el ingreso escrito por el usuario
        // mas el saldo actual (getSaldo)
        double incrementoSaldo = ingreso + this.getSaldo_cuenta(); 
        
            System.out.println("Dinero ingresado correctamente");
            System.out.println("Su sueldo a intcrementado a " + incrementoSaldo);
            this.setSaldo_cuenta(incrementoSaldo);
            return "Su sueldo a intcrementado a " + incrementoSaldo;
        }
    public  String retirarDinero(){
        
        System.out.println("Indique la cantidad a retirar");
        double cantidadRetiro = teclado.nextDouble();
        
//        while ( cantidadRetiro > this.saldo_cuenta){
//            System.out.println("Operacion no realizada, vuelva a introducir la cantidad");
//            cantidadRetiro=teclado.nextDouble();
//        }
        double retiroSaldo = this.getSaldo_cuenta() - cantidadRetiro;
        System.out.println("Cantidad retirada correctamente");
    
        
         return "Su sueldo a disminuido a " + retiroSaldo;
    }
    
}
