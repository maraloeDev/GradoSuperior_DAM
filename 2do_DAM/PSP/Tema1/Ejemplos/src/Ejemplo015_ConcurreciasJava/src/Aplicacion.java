package Ejemplo015_ConcurreciasJava.src;

import java.util.concurrent.atomic.AtomicInteger;

public class Aplicacion {

    public static void main(String[] args) {

        AtomicInteger contador = new AtomicInteger();
//        /*Thread proceso = new Thread(()-> {
//            System.out.println("Soy un proceso");
//        });
//        proceso.start();*/

        Proceso p1 = new Proceso("1", contador);
        Proceso p2 = new Proceso("2", contador);
        Proceso p3 = new Proceso("3", contador);
        Proceso p4 = new Proceso("4", contador);
    }
}
