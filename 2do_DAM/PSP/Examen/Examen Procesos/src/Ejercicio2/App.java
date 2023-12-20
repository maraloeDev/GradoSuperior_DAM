package Ejercicio2;

import java.util.ArrayList;
import java.util.List;


public class App {

    public static void main(String[] args) throws InterruptedException {

        // Creo una lista, para guardar el numero de consumidores
        List<ConsumidorBotella> consumidorBotellas = new ArrayList<>();

        ProductorFuente productorFuente = new ProductorFuente("Productor1");
        productorFuente.getHilo().start();

        for (int i = 1; i <= 4; i++) {

            ConsumidorBotella consumidorBotella = new ConsumidorBotella("Botella " + i, productorFuente);
            consumidorBotella.getHilo().start();
            consumidorBotellas.add(consumidorBotella);

        }
// Una vez que acabe el bucle for, espera 10 segundos
        try {
            Thread.sleep(10000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

        // Cuando pasan los 10 segundos, se pasa interrumpur a false para que pare

        productorFuente.setInterrumpir(false);

        // Guardamos en una lista todos los consumidores para interrumpirlos cuando pase el tiempo (10 millis)

        for ( ConsumidorBotella consumidor : consumidorBotellas){
            consumidor.getHilo().interrupt();
        }
    }
}
