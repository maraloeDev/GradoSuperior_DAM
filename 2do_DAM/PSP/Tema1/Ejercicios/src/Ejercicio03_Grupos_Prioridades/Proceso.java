package Ejercicio03_Grupos_Prioridades;

public class Proceso implements Runnable{
	
	private Contador contador;
	private int contadorP;

	@Override
	public void run() {

		while(contador.getContador() < 100000) {
		synchronized (contador) {
			
			contador.setContador(contador.getContador()+1);
			contadorP++;
		}
		
	}
		System.out.println("El hilo " + hilo.getName() + 
				" ha contado " + contadorP +
				" con una prioridad de " + hilo.getPriority());
	}
	
	Thread hilo;
	Thread grupo;
	
	public Proceso(String nombre, int prioridad, Contador contador) {
		this.hilo = new Thread(nombre);
		hilo.setPriority(prioridad);
		this.contador=contador;
	}
	
	

	public Proceso(String nombre, int prioridad, ThreadGroup grupo,Contador contador) {
		this.hilo = new Thread(grupo, this, nombre);
		hilo.setPriority(prioridad);
		this.contador=contador;
	}



	public Thread getHilo() {
		return hilo;
	}

	public Contador getContador() {
		return contador;
	}
	
	

}
