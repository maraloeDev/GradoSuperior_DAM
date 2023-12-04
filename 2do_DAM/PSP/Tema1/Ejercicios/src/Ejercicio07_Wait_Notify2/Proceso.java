package Ejercicio07_Wait_Notify2;

public class Proceso implements Runnable {

    private int contador;

    @Override
    public void run() {

        while (contador <= 100000){
            contador++;

            notify();
        }
    }

    Thread hilo;

    public Proceso(String nombre) {

        this.hilo = new Thread(nombre);

    }

    public Thread getHilo() {
        return hilo;
    }
}
