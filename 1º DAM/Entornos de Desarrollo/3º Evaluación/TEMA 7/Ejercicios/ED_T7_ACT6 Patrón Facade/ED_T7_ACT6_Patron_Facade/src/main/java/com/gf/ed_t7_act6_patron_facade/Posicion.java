/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package patronfacade2;

/**
 * Posicion GPS
 * @author Eduardo Martín-Sonseca
 */
public class Posicion {
    
    private String Latitud;
    private String Longitud;
    private String Altura;
    private String Fecha;

    public String getLatitud() {
        return Latitud;
    }

    public void setLatitud(String Latitud) {
        this.Latitud = Latitud;
    }

    public String getLongitud() {
        return Longitud;
    }

    public void setLongitud(String Longitud) {
        this.Longitud = Longitud;
    }

    public String getAltura() {
        return Altura;
    }

    public void setAltura(String Altura) {
        this.Altura = Altura;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    @Override
    public String toString() {
        return "Posicion GPS {" + "Latitud=" + Latitud + ", Longitud=" + Longitud + ", Altura=" + Altura + ", Fecha=" + Fecha + '}';
    }

   
    
    
    
}
