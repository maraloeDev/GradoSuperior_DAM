package Ejercicio1;

public class App {

    public static void main(String[] args) {

        Contador contador = new Contador(0);

        for (int i = 1; i <= 4; i++) {
            if (i <= 2) {
                Proceso proceso = new Proceso("Ventanilla " + i, contador, Thread.MAX_PRIORITY);
                proceso.getHilo().start();

            } else {
                Proceso proceso = new Proceso("Ventanilla " + i, contador, Thread.MIN_PRIORITY);
                proceso.getHilo().start();
            }


        }

    }
}
