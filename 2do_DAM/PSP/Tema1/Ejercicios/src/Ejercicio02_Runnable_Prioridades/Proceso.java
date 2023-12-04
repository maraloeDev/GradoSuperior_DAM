package Ejercicio02_Runnable_Prioridades;

public class Proceso implements Runnable {

	/* Realizar un programa que cuente hasta 100000 entre tres procesos y que al finalizar muestre
un resumen de las veces que ha contado cada uno. Debemos tener en cuenta que cada proceso
tiene prioridades distintas, y tendrá que informarse en el resumen final. Implementar la clase
Runnable para realizarlo. Hacerlo con los procesos sincronizados y sin sincronizarlos. ¿Cuenta
más veces el proceso que tiene más prioridad? */
	private Contador contador;
	private int contadorPersonal = 0;
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
		
		while(contador.getContador() <= 100000) {
			//contador++;
			//contadorPersonal++;
			
			//System.out.println("Me llamo " + hilo.getName() + " y tengo prioridad " + hilo.getPriority());
			
			synchronized (contador) { // El synchronized entra solamente 1 hilo 
				
				contador.setContador(contador.getContador()+1);
				contadorPersonal++;
				
				System.out.println("Me llamo " + hilo.getName() +
						" y tengo prioridad " +
						hilo.getPriority());
			}
			
		}
		System.out.println("Me llamo " + hilo.getName() +
				" y tengo prioridad " + hilo.getPriority() + 
				" , y mi contador es " + contadorPersonal);
	}
	
	//Con el Thread es la clase que permite que un metodo fguncione de forma asicrona
	
	Thread hilo;

	public Proceso(String nombre, int priority, Contador contador) {
		this.hilo = new Thread(this, nombre);
		this.contador=contador;
		hilo.setPriority(priority);
	}
	
	
	public Thread getHilo() {
		return hilo;
	}

	public int getContadorPersonal() {
		return contadorPersonal;
	}
	
}
