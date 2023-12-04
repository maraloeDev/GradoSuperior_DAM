package Ejercicio03_Grupos_Prioridades;

import java.util.Scanner;

public class App {
	
	public static void main(String[] args) {
		Contador contador = new Contador();
		try (Scanner scanner = new Scanner(System.in)) {
			System.out.println("número de procesos a crear");
			int process = scanner.nextInt();
			
			if(process < 2) {
				process = 2;
			}
			
			ThreadGroup g1 = new ThreadGroup("Grupo1");
			ThreadGroup g2 = new ThreadGroup("Grupo2");
			
			
			for (int i = 0; i < process; i++) {
				if (i==0) {
					
					Proceso proceso1 = new Proceso("Proceso 0", Thread.MIN_PRIORITY, g1, contador);
					proceso1.hilo.start();
				} else {
					Proceso proceso2 = new Proceso("Proceso "+i, Thread.MAX_PRIORITY, g2,contador);
					proceso2.hilo.start();
					
				}
			}
		}
		
		
	}

}
