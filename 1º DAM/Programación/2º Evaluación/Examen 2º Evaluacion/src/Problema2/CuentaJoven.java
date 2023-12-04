package Problema2;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Eduardo Martin - Sonseca
 */
public class CuentaJoven extends Cuenta{
    
    double comision = 0;

    public CuentaJoven(String numero_cuenta, double saldo_cuenta, double comision_cuenta) {
        super(numero_cuenta, saldo_cuenta, comision_cuenta);
    }

    public CuentaJoven() {
    }

    public double getComision() {
        return comision;
    }

    public void setComision(double comision) {
        this.comision = comision;
    }

    @Override
    public String toString() {
        return "CuentaJoven{" + "comision=" + comision + '}';
    }

    
    
    
    
    
    
    
    
}
