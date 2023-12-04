package Ejercicio05_MatandoProcesosRunnable;

public class App {

	public static void main(String[] args) {
		
		Contador contador = new Contador();
		ThreadGroup grupo = new ThreadGroup("G1");
		
		for (int i = 0; i < 5; i++) {
				
				Proceso proceso = new Proceso("Proceso " + i, contador, grupo);
				proceso.getHilo().start();
		}
	}
}
