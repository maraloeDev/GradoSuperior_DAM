package Ejercicio06_Wait_Notify;

import java.util.ArrayList;
import java.util.Scanner;

public class App {
	
	static Scanner sc = new Scanner(System.in);


	public static void main(String[] args) {

		String palabra;

		ArrayList<Proceso> listaStrs = new ArrayList<>();

	DatoCompartido datoCompartido = new DatoCompartido();


		for (int i = 1; i <= 5; i++) {

			Proceso proceso = new Proceso("Proceso " + i, datoCompartido);
			proceso.getHilo().start();

			listaStrs.add(proceso);
		}
		do {

			System.out.println("Introduce una palabra");
			palabra = sc.nextLine();
			datoCompartido.setDato(palabra);

		}while (!palabra.equalsIgnoreCase("fin"));

		for (Proceso pro: listaStrs) {
			pro.getHilo().interrupt();

		}



	}

}
