package Examenes.Ejercicio2;

public class ProcesoPrincipal implements Runnable {

	private Thread thread;
	private NumeroCompartido numeroCompartido;

	public ProcesoPrincipal(NumeroCompartido numeroCompartido) {
		this.thread = new Thread(this);
		this.numeroCompartido = numeroCompartido;
	}

	public Thread getThread() {
		return thread;
	}

	@Override
	public void run() {
		for (int i = 0; i < 100; i++) {
			this.numeroCompartido.generarNumero();
		}
		this.numeroCompartido.setFin(true);
		synchronized (numeroCompartido) {
			numeroCompartido.notify();
		}
	}

}
