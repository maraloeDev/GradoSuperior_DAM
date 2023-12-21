package Ejercicio3;

public class App {

    public static void main(String[] args) {

        Mensaje mensaje = new Mensaje("");

        ServicioChat servicioChat = new ServicioChat(mensaje);
        servicioChat.start();

        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

        EmisorChat emisorChat = new EmisorChat(mensaje);
        emisorChat.start();

    }
}
