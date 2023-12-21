package Ejercicio2;

import java.util.Random;

public class ProductorFuente implements Runnable {

    Random random = new Random();
    boolean gota = false;
    boolean interrumpir = true;

    @Override
    public void run() {

        while (interrumpir) {
            int nAleatorio = random.nextInt(1, 10);
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

    public boolean isInterrumpir() {
        return interrumpir;
    }

    public void setInterrumpir(boolean interrumpir) {
        this.interrumpir = interrumpir;
    }

    public Thread getHilo() {
        return hilo;
    }

    public void setHilo(Thread hilo) {
        this.hilo = hilo;
    }
}
