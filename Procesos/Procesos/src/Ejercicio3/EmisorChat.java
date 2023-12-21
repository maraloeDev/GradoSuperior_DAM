package Ejercicio3;

public class EmisorChat extends Thread{

    //PRODUCTOR
    private Mensaje mensaje;


    public EmisorChat(Mensaje mensaje) {
        this.mensaje = mensaje;
    }

    @Override
    public void run() {

        for (int i = 0; i < 10; i++) {
            mensaje.setDestinatario("Proceso " +i);
            mensaje.setMensaje(String.valueOf(i));
            System.out.println("Soy el productor " + i);


        }

    }
}
