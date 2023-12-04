package Ejemplo07_Productor_Consumidor;

import java.util.Scanner;

public class Productor extends Thread {

	DatoCompartido dato;
	
	public Productor(DatoCompartido dato) {
		// TODO Auto-generated constructor stub
		this.dato=dato;
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		super.run();
		
		Scanner teclado=new Scanner(System.in);
		/*opcion 1.
		 * String cadena=teclado.nextLine();
		 *
		do {
			dato.setCadena(cadena);
			synchronized (dato) {
				dato.notify();
			}
			cadena=teclado.nextLine();
		} while(!cadena.equals("fin"));
		dato.setCadena(cadena);
		synchronized (dato) {
			dato.notify();	
		}*/
		/** Opcion2*/
		String cadena;
		do {
			cadena=teclado.nextLine();
			dato.setCadena(cadena);
			synchronized (dato) {
				dato.notify();
			}
		} while(!cadena.equals("fin"));
		
	}
}
