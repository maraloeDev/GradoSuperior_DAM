/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package EjerciciosTEMA7.Mapas;


import java.time.LocalDate;
import javax.swing.text.DateFormatter;

/**
 *
 * @author maraloed
 */
public class Cuenta {
    
    private String numeroCuenta;
    private LocalDate fechaApertura;
    private double saldo;

    public Cuenta() {
    }

    public Cuenta(String numeroCuenta, LocalDate fechaApertura, double saldo) {
        this.numeroCuenta = numeroCuenta;
        this.fechaApertura = fechaApertura;
        this.saldo = saldo;
    }

    public String getNumeroCuenta() {
        return numeroCuenta;
    }

    public void setNumeroCuenta(String numeroCuenta) {
        this.numeroCuenta = numeroCuenta;
    }

    public LocalDate getFechaApertura() {
        return fechaApertura;
    }

    public void setFechaApertura(LocalDate fechaApertura) {
        this.fechaApertura = fechaApertura;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    @Override
    public String toString() {
        
        DateFormatter dtf;
        return "Cuenta{" + "numeroCuenta=" + numeroCuenta + ", fechaApertura=" + fechaApertura + ", saldo=" + saldo + '}';
    }
    
    
}
