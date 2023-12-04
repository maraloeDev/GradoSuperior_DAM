package Ejercicio07_Wait_Notify2;

import java.util.ArrayList;
import java.util.Random;

public class App {

    public static void main(String[] args) {

        Random rndm = new Random();
        ArrayList<Integer> aleatorio = new ArrayList<>();
        for (int i = 0; i <= 3 -1; i++) {

            try {
                Thread.sleep(3000);
            aleatorio.add(rndm.nextInt(0,5));
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }

Proceso proceso = new Proceso("Proceso " + i);

        System.out.println("Numeros aleatorios generados : " + aleatorio.get(i));
        }

    }
}