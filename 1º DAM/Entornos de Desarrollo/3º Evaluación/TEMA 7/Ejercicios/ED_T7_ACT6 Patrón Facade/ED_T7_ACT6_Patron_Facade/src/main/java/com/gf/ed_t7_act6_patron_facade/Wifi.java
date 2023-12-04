/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package patronfacade2;

/**
 * Adaptador WIFI
 * @author Eduardo Martín-Sonseca
 */
public class Wifi {

    private String wifi;

    public void Encender() {
        System.out.println("WIFI encendida");
    }

    public void Conectar(String SSID) {

        wifi = SSID;
        System.out.println("Conectar a WIFI " + SSID);

    }

    public void Desconectar() {
        System.out.println("Desconectar WIFI " + wifi);

    }

    public void Apagar() {

        System.out.println("Wifi apagada");
    }

    public String getWifi() {
        return wifi;
    }

    public void setWifi(String wifi) {
        this.wifi = wifi;
    }
    
    

}
