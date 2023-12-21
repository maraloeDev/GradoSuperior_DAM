package Ejercicio1;

public class App {

    public static void main(String[] args) {

    Contador contador = new Contador(0);

        for (int i = 1; i <= 4; i++) {

            if (i <=2){
                Procesos procesosVIP = new Procesos("Ventanilla " + i, contador,Thread.MAX_PRIORITY);
                procesosVIP.getHilo().start();
            } else{

                Procesos procesosPlebeyos = new Procesos("Ventanilla " + i, contador,Thread.MIN_PRIORITY);
                procesosPlebeyos.getHilo().start();
            }
        }
    }
}
