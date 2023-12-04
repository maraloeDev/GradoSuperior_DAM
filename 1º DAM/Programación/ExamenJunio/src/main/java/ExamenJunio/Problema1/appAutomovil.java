/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ExamenJunio.Problema1;

/**
 *
 * @author Eduardo
 */
public class appAutomovil {
    
    public static void main(String[] args) {
        Automovil automovil = new Automovil("ABC123", 180, 50.0);
        automovil.arrancar();
        automovil.acelerar();
        automovil.entrar();
        automovil.acelerar();
        automovil.decelerar();
        automovil.salir();
        automovil.parar();
        automovil.repostar();
        System.out.println(automovil);
    }
    
}
