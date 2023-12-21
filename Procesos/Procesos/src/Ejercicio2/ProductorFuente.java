package Ejercicio2;

import java.util.Random;

public class ProductorFuente extends Thread {

    Random random = new Random();
    boolean gota = false;

    @Override
    public void run() {

        while (isInterrupted()) {
            int nAleatorio = random.nextInt(10);
            try {
                Thread.sleep(nAleatorio);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
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
}
