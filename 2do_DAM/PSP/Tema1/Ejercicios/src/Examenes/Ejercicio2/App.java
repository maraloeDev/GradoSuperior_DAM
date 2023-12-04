package Examenes.Ejercicio2;

public class App {

	public static void main(String[] args) {
		NumeroCompartido numeroCompartido = new NumeroCompartido(100);
		ProcesoPrincipal procesoPrincipal = new ProcesoPrincipal(numeroCompartido);
		procesoPrincipal.getThread().start();

		ProcesoContador procesoContador = new ProcesoContador("Proceso contador", numeroCompartido);
		procesoContador.getThread().start();

	}
}
