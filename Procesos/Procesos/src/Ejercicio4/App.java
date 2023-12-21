package Ejercicio4;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class App {

    public static void main(String[] args) {

        Pieza pieza = new Pieza(1);
        ArrayList<ConsumidorEmpresa> consumidorEmpresaArrayList = new ArrayList<ConsumidorEmpresa>();

        ProductorImpressor productorImpressor = new ProductorImpressor("productor1", 0);
        productorImpressor.getHilo().start();

        for (int i = 1; i <= 3; i++) {
            ConsumidorEmpresa consumidorEmpresa = new ConsumidorEmpresa("consumidor " + i, productorImpressor);
            consumidorEmpresa.getHilo().start();
            consumidorEmpresaArrayList.add(consumidorEmpresa);
        }

        try {
            Thread.sleep(10000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

        for (ConsumidorEmpresa item : consumidorEmpresaArrayList) {
            item.getHilo().interrupt();
        }

        productorImpressor.getHilo().interrupt();
    }
}
