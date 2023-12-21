package Ejercicio4;

import Ejercicio2.ConsumidorBotella;
import Ejercicio2.ProductorFuente;

import java.util.Random;

public class ConsumidorEmpresa implements Runnable {

    private ProductorImpressor productorImpressor;
    Random random = new Random();


    @Override
    public void run() {


        while (!Thread.interrupted()) {

            int piezasRestantes = -1;
            synchronized (productorImpressor) {
                if (productorImpressor.getnPiezas() > 0) {
                    productorImpressor.setnPiezas(productorImpressor.getnPiezas() - 1);
                    piezasRestantes=productorImpressor.getnPiezas();


                }
            }

            if (piezasRestantes < 0) {
                continue;
            } else {

                System.out.println("Las piezas restantes son " + piezasRestantes);
                int nAleatorio = random.nextInt(3000);

                try {
                    Thread.sleep(nAleatorio);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
                System.out.println("He construido un cochazo");
            }
        }
    }

    Thread hilo;

    public ConsumidorEmpresa(String nombre, ProductorImpressor productorImpressor) {
        this.hilo = new Thread(this, nombre);
        this.productorImpressor = productorImpressor;
    }

    public ProductorImpressor getProductorImpressor() {
        return productorImpressor;
    }

    public void setProductorImpressor(ProductorImpressor productorImpressor) {
        this.productorImpressor = productorImpressor;
    }

    public Thread getHilo() {
        return hilo;
    }

    public void setHilo(Thread hilo) {
        this.hilo = hilo;
    }
}
