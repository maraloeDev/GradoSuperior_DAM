package Ejemplo06_Join_Vield_Diamond;

public class Apllicacion {
	
	public static void main(String[] args) {
		for (int i = 0; i < 4; i++) {
			
			Proceso p = new Proceso();
			
			p.setDaemon(true);
					p.start();
					
					try { //Obliga aque puerda CPU
						p.join();
					} catch(InterruptedException ex) {
						ex.printStackTrace();
					}
					
					//El wait le pasa un tiempo de espera sale del tiempo de espora cuando reciba un notify o notifyAll
		}
	}

}
