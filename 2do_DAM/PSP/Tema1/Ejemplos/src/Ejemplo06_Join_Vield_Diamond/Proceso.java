package Ejemplo06_Join_Vield_Diamond;

public class Proceso extends Thread {
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
		super.run();
		
		
		for (int i = 0; i < 1000; i++) {
			System.out.println("Proceso " + getName() + " numero " + i
					+ "numero de procesos activos " + getThreadGroup().activeCount());
			
			this.yield();
			
		}
	}

}
