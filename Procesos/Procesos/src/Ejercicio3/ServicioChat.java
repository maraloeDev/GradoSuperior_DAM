package Ejercicio3;

public class ServicioChat extends Thread{

    //CONSUMIDOR
    private Mensaje mensaje;

    @Override
    public void run() {

        int i=1;
        System.out.println(".....");
        while (i<10){
            System.out.println("El mensaje llego " + i + " con " + mensaje.getMensaje());
            i++;
        }
    }
    public ServicioChat(Mensaje mensaje) {
        this.mensaje = mensaje;
    }
}
