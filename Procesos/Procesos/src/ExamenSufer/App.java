package ExamenSufer;

public class App {

    public static void main(String[] args) {

        Navajas contador = new Navajas(1000);
        for (int i = 1; i <= 10; i++) {

            if(i<=6){
                Vendedor procesoTarjeta = new Vendedor("Vendedor " + i, contador, Thread.MAX_PRIORITY);
                procesoTarjeta.getHilo().start();
            }
            if(i == 10){
                Vendedor procesoTarjeta = new Vendedor("Vendedor" + i, contador, Thread.MIN_PRIORITY);
                procesoTarjeta.getHilo().start();
            }
        }
    }
}
