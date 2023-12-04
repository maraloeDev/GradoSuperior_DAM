package Ejemplo07_Productor_Consumidor;


public class Consumidor extends Thread {

	DatoCompartido dato;
	
	public Consumidor(DatoCompartido dato) {
		// TODO Auto-generated constructor stub
		this.dato=dato;
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		super.run();
		
		do {
			synchronized (dato) {
				try {
					dato.wait();
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			System.out.println("Soy el consumidor: "+dato.getCadena());
		} while(!dato.getCadena().equals("fin"));
		
		
	}

}
