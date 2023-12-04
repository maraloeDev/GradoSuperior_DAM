package Ejercicio06_Wait_Notify;

import java.util.ArrayList;

public class Proceso implements Runnable {

    private int contador;
    private DatoCompartido datoCompartido;
    ArrayList<String> listaStrs = new ArrayList<>();

    @Override
    public void run() {


        try {
            while (!Thread.interrupted()) {

                String dato = null;
                dato = datoCompartido.esperaPf();
                listaStrs.add(dato);
            }
        } catch (InterruptedException e) {
        }


        for (int i = 0; i < listaStrs.size(); i++) {
            System.out.println("Soy el proceso " + getHilo().getName() + " y tengo la palabra " + listaStrs.get(i));

        }
    }

    Thread hilo;

    public Proceso(String nombre, DatoCompartido datoCompartido) {
        this.hilo = new Thread(this, nombre);
        this.datoCompartido = datoCompartido;

    }

    public Thread getHilo() {
        return hilo;
    }
}