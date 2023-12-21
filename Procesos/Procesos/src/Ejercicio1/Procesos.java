package Ejercicio1;

import java.util.SplittableRandom;

public class Procesos  implements Runnable{

    private Contador contador;
    private int contadorP;

    @Override
    public void run() {

        while (contador.getContador() <= 50000){
            contador.setContador(contador.getContador()+1);
            contadorP++;
        }
        System.out.println(contadorP + " " + getHilo().getName());
        System.out.println("NO HAY MAS ENTRADAS");

    }

    Thread hilo;

    public Procesos(String nombre, Contador contador, int prioridad){
        this.hilo = new Thread(this, nombre);
        this.contador=contador;
        this.hilo.setPriority(prioridad);
    }

    public Contador getContador() {
        return contador;
    }

    public void setContador(Contador contador) {
        this.contador = contador;
    }

    public int getContadorP() {
        return contadorP;
    }

    public void setContadorP(int contadorP) {
        this.contadorP = contadorP;
    }

    public Thread getHilo() {
        return hilo;
    }

    public void setHilo(Thread hilo) {
        this.hilo = hilo;
    }
}
