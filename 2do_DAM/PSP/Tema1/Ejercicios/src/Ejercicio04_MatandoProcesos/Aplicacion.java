package Ejercicio04_MatandoProcesos;

public class Aplicacion {

	public static void main(String[] args) {
		ThreadGroup gPapa = new ThreadGroup("Grupito");
		ThreadGroup gHijo = new ThreadGroup(gPapa, "Grupito2");
		
		for (int i = 0; i < 100; i++) {
			
			Proceso p1 = new Proceso("Proceso " + i, gHijo);
			p1.hilo.start();
		}
		
		try {
			Thread.sleep(1000);
			gHijo.interrupt();
			
		} catch (InterruptedException e) {
			
			e.printStackTrace();
		}
		
		

	}

}
