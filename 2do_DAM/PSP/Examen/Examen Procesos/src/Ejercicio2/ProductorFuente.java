package Ejercicio2;

import java.util.Random;

public class ProductorFuente implements Runnable {

    Random random = new Random();
   boolean gota = false;
   boolean interrumpir = true;

    @Override
    public void run() {

        // Mientras sea interrumpido, entonces se crea un numero aleatorio entre 1 y 10
        while (interrumpir) {
            int nAleatorio = random.nextInt(1, 10);
            try {
                Thread.sleep(nAleatorio);

            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            // Una vez que acabe el milisegundo, se establece la gota a true
            setGota(true);
        }
    }

    Thread hilo;

    public ProductorFuente(String nombre) {
        this.hilo = new Thread(this, nombre);
    }

    public Random getRandom() {
        return random;
    }

    public void setRandom(Random random) {
        this.random = random;
    }

    // Los metodos de la gota, se sincronizan debido a que al final, es el dato que van a compartir el productor y el consumidor
    public synchronized boolean isGota() {
        return gota;
    }

    public synchronized void setGota(boolean gota) {
        this.gota = gota;
    }

    public Thread getHilo() {
        return hilo;
    }

    public void setHilo(Thread hilo) {
        this.hilo = hilo;
    }

    public boolean isInterrumpir() {
        return interrumpir;
    }

    // Se cambia el valor de la variable, con este metodo
    public void setInterrumpir(boolean interrumpir) {
        this.interrumpir = interrumpir;
    }
}
