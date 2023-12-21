package Ejercicio2;

public class ConsumidorBotella implements Runnable {

    // Se crea una variable productor para almacenarla en el consumidor
    public ProductorFuente productorFuente;
    public int liquidPacage;

    @Override
    public void run() {

        // Mientras que no sea interrumpido, si tiene gota, suma al pacageLiquid 1 y la gota pasa a false
        while (!Thread.interrupted()) {

            if (productorFuente.isGota()) {
                liquidPacage++;
                productorFuente.setGota(false);
            }
        }
        // Cuando el hilo no sea interrumpido, se mostrara un mensaje con el numero de gotas
        System.out.println("He recogido " + liquidPacage + " gotas");

    }

    // Se crea el hilo
    Thread hilo;

    // Se crea el constructor con el nombre, y el productor, (el hilo se inicializa con el THIS (si no, no funciona) y el nombre
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
