package Ejercicio2;

public class ConsumidorBotella implements Runnable {

    public ProductorFuente productorFuente;
    public int contadorLiquido;
    public boolean interrumpir=true;


    @Override
    public void run() {

        while (interrumpir) {
            synchronized (productorFuente){

            if (productorFuente.isGota()) {
                contadorLiquido++;
                productorFuente.setGota(false);
            }
            }
        System.out.println("He recogido: " + contadorLiquido + " gotas ");
        }
    }

    Thread hilo;

    public ConsumidorBotella(String nombre, ProductorFuente productorFuente) {
        this.hilo = new Thread(this, nombre);
        this.productorFuente = productorFuente;
    }

    public ProductorFuente getProductorFuente() {
        return productorFuente;
    }

    public boolean isInterrumpir() {
        return interrumpir;
    }

    public void setInterrumpir(boolean interrumpir) {
        this.interrumpir = interrumpir;
    }

    public void setProductorFuente(ProductorFuente productorFuente) {
        this.productorFuente = productorFuente;
    }

    public int getContadorLiquido() {
        return contadorLiquido;
    }

    public void setContadorLiquido(int contadorLiquido) {
        this.contadorLiquido = contadorLiquido;
    }

    public Thread getHilo() {
        return hilo;
    }

    public void setHilo(Thread hilo) {
        this.hilo = hilo;
    }
}
