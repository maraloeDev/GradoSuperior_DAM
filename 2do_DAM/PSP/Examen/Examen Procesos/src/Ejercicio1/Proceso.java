package Ejercicio1;

public class Proceso implements Runnable {

    private Contador contador;
    private int contadorP;

    @Override
    public void run() {

        while (contador.getContador() < 50000){
            contadorP++;
            contador.setContador(contador.getContador()+1);
        }

        System.out.println(contadorP + " " + hilo.getName());
        System.out.println("NO HAY MAS ENTRADAS");

    }

    Thread hilo;

    public Proceso(String nombre, Contador contador, int prioridad) {
        this.hilo = new Thread(this, nombre);
        this.contador=contador;
        hilo.setPriority(prioridad);
    }

    public Contador getContador() {
        return contador;
    }

    public int getContadorP() {
        return contadorP;
    }

    public Thread getHilo() {
        return hilo;
    }
}
