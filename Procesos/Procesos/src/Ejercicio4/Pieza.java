package Ejercicio4;

public class Pieza {

    private int nPiezas;

    public Pieza(int nPiezas) {
        this.nPiezas = nPiezas;
    }

    public synchronized int getnPiezas() {
        try {
            wait();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

        this.nPiezas-=1;
        return nPiezas;
    }

    public synchronized void setnPiezas(int nPiezas) {
        this.nPiezas += nPiezas;
        notify();
    }
}
