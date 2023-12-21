package Ejercicio3;

import java.util.ArrayList;
import java.util.List;

public class Mensaje {

    private String mensaje;
    private String destinatario;
    private List<String> mensajes = new ArrayList<>();

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
        String aux=mensajes.get(0);
        mensajes.remove(0);

        return aux;
    }

    public synchronized void setMensaje(String mensaje) {
        this.mensaje = mensaje;
        mensajes.add(mensaje);

    }

    public String getDestinatario() {
        return destinatario;
    }

    public void setDestinatario(String destinatario) {
        this.destinatario = destinatario;
    }
}
