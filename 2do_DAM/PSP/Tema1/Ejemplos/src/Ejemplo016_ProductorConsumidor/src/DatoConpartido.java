import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.SynchronousQueue;

public class DatoConpartido {

/* Se utiliza para sincrinizar un dato para que alguien nuevo lo coja */
    private SynchronousQueue<Integer> lista = new SynchronousQueue<>();

    public SynchronousQueue<Integer> getLista() {
        return lista;
    }

    public void setLista(SynchronousQueue<Integer> lista) {
        this.lista = lista;
    }

    public void producir(int i) {
        try {
            lista.put(i);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }

    public int consumir() {
        return lista.poll(); // Devuelves y quitas
    }
}
