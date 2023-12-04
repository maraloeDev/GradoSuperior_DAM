package Ejemplo03_ProcesoRunnable;

public class Aplicación {
	
	/**
	 * En esta clase, el objeto  threadGroup te permite crear un grupo de procesos
	 *
	 * @param args the arguments
	 */
	public static void main(String[] args) {
		
		
		ThreadGroup grupo1 = new ThreadGroup("grupo1");
		
		Proceso proceso = new Proceso("Proceso 1", grupo1);
		proceso.getProceso().setPriority(Thread.MAX_PRIORITY);
		proceso.getProceso().start(); 
		
		Proceso proceso2 = new Proceso("Proceso 2", grupo1);
		proceso.getProceso().setPriority(Thread.MAX_PRIORITY);
		proceso2.getProceso().start();
		
		Proceso proceso3 = new Proceso("Proceso 3", grupo1);
		proceso.getProceso().setPriority(Thread.MAX_PRIORITY);
		proceso3.getProceso().start();
		
		Proceso proceso4 = new Proceso("Proceso 4", grupo1);
		proceso.getProceso().setPriority(Thread.MAX_PRIORITY);
		proceso4.getProceso().start();
		
	}

}
