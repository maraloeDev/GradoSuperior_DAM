package patronfacade2;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Clase Facade
 * @author Eduardo Martín-Sonseca
 */
public class Facade {

    GPS gps;
    Wifi wifi;

    public void ConectarAWifi(String SSID) {

        wifi = new Wifi();
        wifi.Encender();
        wifi.Conectar(SSID);

    }

    public void DesconectarDeWifi() {

        wifi.Desconectar();
        wifi.Apagar();
    }

    public Posicion ObtenerPosicion() {

        Posicion p;
        gps = new GPS();
        gps.Encender();
        gps.FijarPosicion();
        p = gps.UltimaPosicion();
        gps.Apagar();
        return p;

    }

}
