package Ejercicio4;

import java.util.Random;

public class ProductorImpressor implements Runnable {

    Random rndm = new Random();
    private int contador;
    public int nPiezas;


    @Override
    public void run() {
        while (!Thread.interrupted()) {
            int nAleatorio = rndm.nextInt(200, 500);

            try {
                Thread.sleep(nAleatorio);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }

            setnPiezas(getnPiezas() + 1);


            contador++;
            System.out.println("Has creado " + getnPiezas() + " piezas");
        }
    }

    Thread hilo;

    public ProductorImpressor(String nombre, int nPiezas) {
        this.hilo = new Thread(this, nombre);
        this.nPiezas = nPiezas;

    }

    public Random getRndm() {
        return rndm;
    }

    public void setRndm(Random rndm) {
        this.rndm = rndm;
    }

    public Thread getHilo() {
        return hilo;
    }

    public void setHilo(Thread hilo) {
        this.hilo = hilo;
    }

    public int getContador() {
        return contador;
    }

    public void setContador(int contador) {
        this.contador = contador;
    }

    public synchronized int getnPiezas() {
        return nPiezas;
    }

    public synchronized void setnPiezas(int nPiezas) {
        this.nPiezas = nPiezas;

    }
}
