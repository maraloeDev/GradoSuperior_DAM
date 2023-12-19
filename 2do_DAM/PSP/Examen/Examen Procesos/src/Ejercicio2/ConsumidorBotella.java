package Ejercicio2;

public class ConsumidorBotella implements Runnable {
    private ProductorFuente productorFuente;
    private int liquidPacage;

    @Override
    public void run() {

        while (!Thread.interrupted()) {

            if (productorFuente.isGota()) {
                liquidPacage++;
                productorFuente.setGota(false);

            }

        }
        System.out.println("He recogido " + liquidPacage + " gotas");

    }

    Thread hilo;

    public ConsumidorBotella(String nombre, ProductorFuente productorFuente) {
        this.hilo = new Thread(this, nombre);
        this.productorFuente = productorFuente;

    }

    public ProductorFuente getProductorFuente() {
        return productorFuente;
    }

    public void setProductorFuente(ProductorFuente productorFuente) {
        this.productorFuente = productorFuente;
    }

    public int getLiquidPacage() {
        return liquidPacage;
    }

    public void setLiquidPacage(int liquidPacage) {
        this.liquidPacage = liquidPacage;
    }

    public Thread getHilo() {
        return hilo;
    }

    public void setHilo(Thread hilo) {
        this.hilo = hilo;
    }
}
