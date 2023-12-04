package Ejercicio04_MatandoProcesos;

public class Proceso implements Runnable {

	private int contador;
	@Override
	public void run() {
		
		while(!Thread.interrupted()) {
			
			contador++;
		
		}
		
		System.out.println("El nombre es " + hilo.getName() 
		+ " con un contador de " + contador);
		
	}
	
	Thread hilo;
	
	public Proceso(String nombre, ThreadGroup grupo) {
	this.hilo = new Thread(grupo, this, nombre);
	
	}

}
