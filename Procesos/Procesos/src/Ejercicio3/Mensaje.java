package Ejercicio3;

import java.util.ArrayList;

public class Mensaje {

    private String mensaje;
    private String destinatario;
    private ArrayList<String> mensajes = new ArrayList<>();

    public Mensaje(String mensaje) {
        this.mensaje = mensaje;
        this.destinatario = destinatario;
    }

    public synchronized String getMensaje() {
        try {
            wait();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        return mensajes.get(0);
    }

    public synchronized void setMensaje(String mensaje) {
        this.mensaje = mensaje;
        mensajes.add(mensaje);
        notify();
    }

    public String getDestinatario() {
        return destinatario;
    }

    public void setDestinatario(String destinatario) {
        this.destinatario = destinatario;
    }
}
