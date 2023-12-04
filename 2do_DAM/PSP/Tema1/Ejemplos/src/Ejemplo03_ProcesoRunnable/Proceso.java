package Ejemplo03_ProcesoRunnable;


public class Proceso implements Runnable {

	Thread proceso;
	
	
	public Proceso() {
		
		proceso = new Thread(this);
	}
	
	public Proceso(ThreadGroup grupo1) {
		
		proceso = new Thread(this);
		}
	
public Proceso(String name, ThreadGroup grupo1) {
	
	this(grupo1);
		
		proceso.setName(name);
	}
	
	public Thread getProceso() {
		return proceso;
	}
	public void setProceso(Thread proceso) {
		this.proceso = proceso;
	}
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
		
		for (int i = 0; i < 100; i++) {
			System.out.println("Soy el proceso " + proceso.getName() + " el numero de proceso es " + i +
							" y soy del grupo " + proceso.getThreadGroup().getName());
			
		}
		
		ThreadGroup grupo = this.getProceso().getThreadGroup();
		Thread[] procesoshermanos = new Thread[grupo.activeCount()];
		grupo.enumerate(procesoshermanos);
		System.out.println("-----------------");
		for (int i = 0; i < procesoshermanos.length; i++) {
			System.out.println(procesoshermanos[i].getName());
			
		}

	}
	
	

}
