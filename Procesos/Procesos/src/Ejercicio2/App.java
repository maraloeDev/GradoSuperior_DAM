package Ejercicio2;

import java.util.ArrayList;
import java.util.List;

public class App {

    public static void main(String[] args) {

        List<ConsumidorBotella> consumidorBotellas = new ArrayList<>();

        ProductorFuente productorFuente = new ProductorFuente("Productor1");
        productorFuente.getHilo().start();

        for (int i = 1; i <= 4; i++) {
            ConsumidorBotella consumidorBotella = new ConsumidorBotella("Consumidor", productorFuente);
            consumidorBotella.getHilo().start();
            consumidorBotellas.add(consumidorBotella);
        }

        try {
            Thread.sleep(10000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }



        for (ConsumidorBotella consumidor : consumidorBotellas) {
            consumidor.setInterrumpir(false);
        }

    }
}
