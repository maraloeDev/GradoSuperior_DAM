package ExamenSufer;

public class Vendedor implements Runnable {

    private Navajas navajas;
    private int ventas;

    @Override
    public void run() {
        while (!(navajas.getContador() <= 0)) {
            synchronized (navajas) {
                ventas++;
                System.out.println("Soy el " + getHilo().getName() +" y he vendido una navaja");
            }


        }
        System.out.println("En total he vendido " + ventas);
    }

    Thread hilo;

    public Vendedor(String nombre, Navajas navajas, int prioridad) {
        this.hilo = new Thread(this, nombre);
        this.navajas = navajas;
        this.hilo.setPriority(prioridad);
    }

    public Navajas getContador() {
        return navajas;
    }

    public void setContador(Navajas contador) {
        this.navajas = contador;
    }

    public int getContadorP() {
        return ventas;
    }

    public void setContadorP(int contadorP) {
        this.ventas = contadorP;
    }

    public Thread getHilo() {
        return hilo;
    }

    public void setHilo(Thread hilo) {
        this.hilo = hilo;
    }
}