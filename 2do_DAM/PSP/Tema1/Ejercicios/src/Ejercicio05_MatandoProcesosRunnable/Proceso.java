package Ejercicio05_MatandoProcesosRunnable;

public class Proceso implements Runnable {

	private Contador contador;
	@Override
	public void run() {
		
	while(contador.getContador() <= 5000 && !Thread.currentThread().isInterrupted()) {
				
		synchronized (contador) {
			contador.setContador(contador.getContador() +1);
			
			if(contador.getContador()==5000) {
				Thread [] hermanos = new Thread[hilo.getThreadGroup().activeCount()]; //Crear un array para tener todos los hilos del grupo
				Thread.enumerate(hermanos); //Guardas todos los hermanos en el array
				
				for (int i = 0; i < hermanos.length; i++) {
					if (hermanos[i] != Thread.currentThread()) { //if hermanos de i es diferente a el hermano actual 
						hermanos[i].interrupt();
						System.out.println("Soy el " +  hermanos[i].getName() + " y me ha matado " + hilo.getName());
					}
					
				}
				System.out.println("zoy el ultimo " + hilo.getName() + " he contado hasta " + contador.getContador());
				
			}
			
		}
		
		
	}
		
	}
	
	Thread hilo;
	
	public Proceso(String nombre, Contador contador, ThreadGroup grupo) {
		this.hilo = new Thread(grupo,this, nombre);
		
		this.contador = contador;
	}

	public Contador getContador() {
		return contador;
	}

	public Thread getHilo() {
		return hilo;
	}
	
	

}


