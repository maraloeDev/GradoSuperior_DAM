import java.util.concurrent.atomic.AtomicInteger;

public class Proceso implements Runnable{

    AtomicInteger contador;
    int contadorP;

    @Override
    public void run() {
        for (int i = 0;contador.get()<10000; i++) {
            /* addAndGet(1) te devuelve el valor del contador y lo incrementa*/
            System.out.println("Proceso " + Thread.currentThread().getName() + " el valor del contador es " + contador.addAndGet(1));
            contadorP++;
        }
        System.out.println("FIN -> Proceso " + Thread.currentThread().getName() + " el valor del contador es " + contadorP);
    }
    Thread hilo;
    public Proceso(String nombre, AtomicInteger contador) {
        this.hilo = new Thread(this, nombre);
        this.contador = contador;
        hilo.start();
    }
}
