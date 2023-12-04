package Examenes.Ejercicio2;

import java.util.Random;

public class NumeroCompartido {

	private int numero;
	private boolean fin;

	public NumeroCompartido(int personas) {
		this.numero = personas;
		this.fin = false;
	}

	public boolean isFin() {
		return fin;
	}

	public void setFin(boolean fin) {
		this.fin = fin;
	}

	public synchronized void generarNumero() {
		Random random = new Random();
		this.numero = random.nextInt(0, 21);
		System.out.println(this.numero);
		notify();
		try {
			wait();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public synchronized boolean verificarNumero() {
		boolean es10 = false;
		notify();
		try {
			wait();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (this.numero == 10) {
			es10 = true;
		}
		this.numero = 0;
		return es10;
	}

}
