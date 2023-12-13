import java.util.Random;

public class Productor extends Thread{

    DatoConpartido datoConpartido;
    @Override
    public void run() {
    Random random = new Random();
        while (true){
            //productor

            random.nextInt();
            datoConpartido.producir(random.nextInt());
        }
    }

    public Productor(DatoConpartido datoConpartido){
        this.datoConpartido=datoConpartido;

    }
}
