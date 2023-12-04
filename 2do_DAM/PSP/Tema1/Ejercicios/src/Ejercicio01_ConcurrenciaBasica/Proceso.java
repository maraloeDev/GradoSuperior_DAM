package Ejercicio01_ConcurrenciaBasica;

public class Proceso implements Runnable {
	Thread procesos;
	private int contador=0;
	private int distancia;

	@Override
	public void run() {
		
		for (int i = 0; i < contador; i++) {
			System.out.println("Soy el proceso " + procesos.getName() +  " estoy en la vuelta" + i);
			
		}
	}

	public Proceso(String nombre, int contador, int distancia) {
		 procesos = new Thread(nombre);
		 this.contador = contador;
		 this.distancia=distancia;
	}
	

}
