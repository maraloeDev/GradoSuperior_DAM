package Ejemplo016_ProductorConsumidor.src;

import java.util.List;

public class Aplicacion {

    public static void main(String[] args) {

DatoConpartido datoConpartido = new DatoConpartido();

        Productor productor = new Productor(datoConpartido);
        Consumidor consumidor = new Consumidor(datoConpartido);
        productor.start();
        consumidor.start();

    }
}
