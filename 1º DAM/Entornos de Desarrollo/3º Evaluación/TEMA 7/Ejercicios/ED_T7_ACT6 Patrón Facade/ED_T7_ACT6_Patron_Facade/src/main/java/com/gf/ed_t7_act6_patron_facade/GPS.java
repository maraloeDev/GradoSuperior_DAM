/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package patronfacade2;

/**
 * Chip del GPS
 * @author Eduardo Martín-Sonseca
 */
public class GPS {

    public void Encender() {

        System.out.println("GPS encendido");

    }

    public void FijarPosicion() {

        System.out.println("Posición fijada");
    }

    public Posicion UltimaPosicion() {
        Posicion p = new Posicion();
        p.setLatitud("5.4");
        p.setLongitud("-0,5");
        p.setAltura("800");
        p.setFecha("2021--04-02 20:00");
        return p;

    }

    public void Apagar() {
        System.out.println("Apagar GPS");

    }
}
