package Ejemplo05_MatandoProcesos;

public class Proceso extends Thread { //Un proceso siempre hereda de Thread
	
	private boolean ejecuta = true;

	public boolean isEjecuta() {
		return ejecuta;
	}



	public void setEjecuta(boolean ejecuta) {
		this.ejecuta = ejecuta;
	}



	public void run() {
		super.run();
		boolean ejecuta = true;
		int i = 0;
		//while (ejecuta) {
		while(!this.interrupted()) {
			System.out.println("Estoy en ejecución " + i);
			i++;
			
			try {
				Thread.sleep(10); // Va avanzando poco a poco
			}catch(InterruptedException e){
				//System.out.println(e.getStackTrace());
				this.interrupt();
			}
			
		}
	}
	
	
	

}
