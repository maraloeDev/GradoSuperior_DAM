    package Problema2;



/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Eduardo Martin - Sonseca
 */
public class CuentaCorriente extends Cuenta{

    double saldoCC;

    public CuentaCorriente(double saldoCC, String numero_cuenta, double saldo_cuenta, double comision_cuenta) {
        super(numero_cuenta, saldo_cuenta, comision_cuenta);
        this.saldoCC = saldoCC;
    }

    public CuentaCorriente() {
    }
    

    public double getSaldoCC() {
        return saldoCC;
    }

    public void setSaldoCC(double saldoCC) {
        this.saldoCC = saldoCC;
    }

    @Override
    public String toString() {
        return "CuentaCorriente{" + "saldoCC=" + saldoCC + '}';
    }
    
    
    
    public String descubiertoCuenta(){
        
        
        if(this.saldoCC < 0){     
            System.out.println("Saldo negativo");
            
            return "Debes al banco un valor de " + getSaldo_cuenta();
            
        } else{
            System.out.println("No le debes nada al banco!!!");
            return "Felicidades";
        }
        
    }
    
    
    
}
