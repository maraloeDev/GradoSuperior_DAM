package Ejercicio06_Wait_Notify;

public class DatoCompartido {

    boolean hayDatos=false;
    String dato="";


    public boolean isHayDatos() {
        return hayDatos;
    }

    public void setHayDatos(boolean hayDatos) {
        this.hayDatos = hayDatos;
    }

    public String getDato() {
        return dato;
    }

    public synchronized void setDato(String dato) {


        setHayDatos(true);

        this.dato = dato;

        notifyAll();
    }

public synchronized String esperaPf() throws InterruptedException {
        while (!hayDatos){

                wait();

        }
        hayDatos=false;
        return dato;
}

}
