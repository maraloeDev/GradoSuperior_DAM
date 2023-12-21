package Ejercicio3;

public class ClienteChat extends Thread{

    Mensaje mensajeInicio;

    @Override
    public void run() {


        while (true){
            System.out.println(mensajeInicio.getDestinatario());
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }

    }
    public ClienteChat(Mensaje mensajeInicio) {
        this.mensajeInicio = mensajeInicio;
    }

}
