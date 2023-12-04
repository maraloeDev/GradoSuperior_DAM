/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package TeatroRecuperacion;

/**
 *
 * @author Eduardo Martín-Sonseca
 */
public class Butaca {
    
    public String clave; //Clave generada de forma aleatoria mediante un Array de caracteres entre la A y la Z
    public boolean ocupado; //Muestra si la botaca esta reservada o no (a ser desde consola, se marcara de color rojo, si no en verde)
    public int nFila; 
    public int nAsiento;

    Butaca(String clave, boolean ocupado, int nFila, int nAsiento) {
       
    }

     public void setClave(String clave) {
        this.clave = clave;
    }    

    public void setOcupado(boolean ocupado) {
        this.ocupado = ocupado;
    }
    public void setFila(int nFila) {
        this.nFila = nFila;
    }
    public void setAsiento(int nAasiento) {
        this.nAsiento = nAasiento;
    }
    
}
