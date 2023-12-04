package Ejemplo01_HolaMundo;

public class Aplicacion {

	public static void main(String[] args) {
		
		Hijo proceso = new Hijo();
		proceso.start();
		
		for (int i = 1; i <= 100; i++) {
			System.out.println(i + " hola soy Aplicacion");
		}
		
		System.out.println("Fin de la clase Aplicacion");

	}

}
