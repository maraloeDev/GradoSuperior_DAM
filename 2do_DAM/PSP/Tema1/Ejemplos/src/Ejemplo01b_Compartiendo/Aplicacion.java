package Ejemplo01b_Compartiendo;

public class Aplicacion {

	public static void main(String[] args) {
		
		String nombrePadre = "Jose Manuel";


		Hijo hijo1 = new Hijo("Ana",2,nombrePadre);
		hijo1.start();
		
		Hijo hijo2 = new Hijo("Pablo",4,nombrePadre);
		hijo2.start();
		
		Hijo hijo3 = new Hijo("Luis",6,nombrePadre);
		hijo3.start();
	}

}
