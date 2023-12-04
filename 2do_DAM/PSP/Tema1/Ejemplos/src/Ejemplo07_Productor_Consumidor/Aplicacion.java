package Ejemplo07_Productor_Consumidor;


public class Aplicacion {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		DatoCompartido dato=new DatoCompartido();
		
		
		Consumidor consumidor=new Consumidor(dato);
		consumidor.start();
		
		Productor productor=new Productor(dato);
		productor.start();
		
		
		
		
		
	}

}
