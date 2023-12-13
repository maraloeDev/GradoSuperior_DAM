public class Consumidor extends Thread {

    DatoConpartido datoConpartido;

    @Override
    public void run() {
        while (true) {
            //consumidor

            System.out.println(datoConpartido.consumir());
        }
    }
    public Consumidor(DatoConpartido datoConpartido){
        this.datoConpartido=datoConpartido;

    }
}