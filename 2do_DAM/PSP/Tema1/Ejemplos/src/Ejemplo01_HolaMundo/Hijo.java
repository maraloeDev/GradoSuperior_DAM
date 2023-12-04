package Ejemplo01_HolaMundo;

public class Hijo extends Thread {

	public Hijo() {
		super();
		// TODO Auto-generated constructor stub
		
		
		System.out.println("Soy un proceso, y me estan creando");
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		super.run();
		
		for (int i = 1; i <= 100; i++) {
			System.out.println(i + " hola soy el hijo");
		}
		
		
	}

	
	
}
