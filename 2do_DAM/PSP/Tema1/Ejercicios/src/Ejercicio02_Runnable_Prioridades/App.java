package Ejercicio02_Runnable_Prioridades;

public class App {

	public static void main(String[] args) {
		
		Contador contador= new Contador();
	
		Proceso proceso1 = new Proceso("Proceso 1", Thread.MIN_PRIORITY, contador);
		proceso1.getHilo().start();
		
		Proceso proceso2 = new Proceso("Proceso 2", Thread.NORM_PRIORITY, contador);
		proceso2.getHilo().start();
		
		Proceso proceso3 = new Proceso("Proceso 3", Thread.MAX_PRIORITY, contador);
		proceso3.getHilo().start();
		
	}

}
