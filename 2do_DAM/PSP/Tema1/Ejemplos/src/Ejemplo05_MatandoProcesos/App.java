package Ejemplo05_MatandoProcesos;

public class App {

	public static void main(String[] args) {
		
		
		Proceso proceso = new Proceso();
		proceso.start();
		
		try {
			Thread.sleep(1000);
		}catch(InterruptedException e){
			// System.out.println(e.getStackTrace());
			// proceso.interrupt(); //El proceso a sido interumpido, cambia el estado de la bandera de false a true
			proceso.getThreadGroup().interrupt();
		}
		
		
		

	}

}
