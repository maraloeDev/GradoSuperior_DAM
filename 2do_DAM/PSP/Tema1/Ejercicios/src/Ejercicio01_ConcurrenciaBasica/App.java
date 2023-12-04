package Ejercicio01_ConcurrenciaBasica;

import java.util.ArrayList;
import java.util.Scanner;

public class App {

	/* Pedir al usuario hasta qué número queremos contar, de cuánto en cuánto y cuántos procesos
vamos a utilizar para ello, y por último mostrar cuántas veces ha contado cada uno de los
procesos. Implementarlo.*/
	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("Hasta qué número quieres contar: ");
		int numeroMax=scanner.nextInt();
		
		System.out.print("De cuánto en cuánto");
		int nVeces=scanner.nextInt();
		
		System.out.println("cuántos procesos vas a utilizar para ello");
		int nProcesos = scanner.nextInt();

		ArrayList<Proceso> plistaProcesos = new ArrayList<>();
		
		for (int i = 0; i < numeroMax; i++) {
			// Añades al AL un nuevo proceso
			
		}
		
		
		scanner.close();
    }
}
