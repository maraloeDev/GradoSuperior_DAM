package ExamenSufer;

public class Navajas {

    private int UnidadesNavajas;

    public Navajas(int contador) {
        this.UnidadesNavajas = contador;
    }

    public int getContador() {
        this.UnidadesNavajas--;
        return UnidadesNavajas;
    }

    public void setContador(int contador) {
        UnidadesNavajas-=1;
        this.UnidadesNavajas = contador;
    }
}
