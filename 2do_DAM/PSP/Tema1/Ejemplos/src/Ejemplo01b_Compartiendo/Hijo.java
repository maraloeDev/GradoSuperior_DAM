package Ejemplo01b_Compartiendo;

public class Hijo extends Thread {
	
	int edad;
	String nombrePadre;

	public Hijo(String name, int edad ,String nombrePadre) {
		super(name);
		this.edad = edad;
		this.nombrePadre = nombrePadre;
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		super.run();
		System.out.println("Soy el hijo " + this.getName() + " con la edad " + this.edad + "anios y mi padre se llama " + this.nombrePadre);
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		nombrePadre = "Jose Luis";
		System.out.println("Soy el hijo " + this.getName() + " con la edad " + this.edad + "anios y mi padre se llama " + this.nombrePadre);
		
		
	}
	
	
}
