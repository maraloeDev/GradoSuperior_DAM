/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package TeatroRecuperacion;

import static TeatroRecuperacion.AppTeatro.pb;
import static TeatroRecuperacion.AppTeatro.precio;
import static TeatroRecuperacion.AppTeatro.rndm;
import static TeatroRecuperacion.AppTeatro.teclado;
import java.time.LocalDate;

/**
 *
 * @author Eduardo Martín-Sonseca
 */
public class Reserva {
    
    private int numero_Reserva;
    private String nombreTitular;
    private String apellidoTitular;
    private String dniTitular;
    private LocalDate horaReserva;
    private double importeReserva;

    public Reserva() {
    }
    
    

    public Reserva(int numero_Reserva, String nombreTitular, String apellidoTitular, String dniTitular, LocalDate horaReserva, double importeReserva) {
        this.numero_Reserva = numero_Reserva;
        this.nombreTitular = nombreTitular;
        this.apellidoTitular = apellidoTitular;
        this.dniTitular = dniTitular;
        this.horaReserva = horaReserva;
        this.importeReserva = importeReserva;
    }

    public int getNumero_Reserva() {
        return numero_Reserva;
    }

    public void setNumero_Reserva(int numero_Reserva) {
        this.numero_Reserva = numero_Reserva;
    }

    public String getNombreTitular() {
        return nombreTitular;
    }

    public void setNombreTitular(String nombreTitular) {
        this.nombreTitular = nombreTitular;
    }

    public String getApellidoTitular() {
        return apellidoTitular;
    }

    public void setApellidoTitular(String apellidoTitular) {
        this.apellidoTitular = apellidoTitular;
    }

    public String getDniTitular() {
        return dniTitular;
    }

    public void setDniTitular(String dniTitular) {
        this.dniTitular = dniTitular;
    }

    public LocalDate getHoraReserva() {
        return horaReserva;
    }

    public void setHoraReserva(LocalDate horaReserva) {
        this.horaReserva = horaReserva;
    }

    public double getImporteReserva() {
        return importeReserva;
    }

    public void setImporteReserva(double importeReserva) {
        this.importeReserva = importeReserva;
    }

    @Override
    public String toString() {
        return "Reserva{" + "numero_Reserva=" + numero_Reserva + ", nombreTitular=" + nombreTitular + ", apellidoTitular=" + apellidoTitular + ", dniTitular=" + dniTitular + ", horaReserva=" + horaReserva + ", importeReserva=" + importeReserva + '}';
    }
    
    public  void reservaauto() { //Metodo que realiza la reserva automatica de asientos
        System.out.println("Introduzca el numero de entradas");
        int numEntradas = teclado.nextInt();
        
        int i = 0;
        while (i < numEntradas) { //Controla el numero de entradas a reservar (pe si son 4, da 4 vueltas de bucle)
            int zonaReserva = rndm.nextInt(1, 2); //Eleccion auto de la zona
            int nfilaReserva = rndm.nextInt(1, 10);//Eleccion auto de la fila
            int nasientoReserva = rndm.nextInt(1, 10);//Eleccion auto del asiento

            //Mientras la butaca reservada de la zona[i], de la fila[j], y de [k] el asiento no esta ocupado (se pone en verde)
            if (PatioButacas.butacaReservada[zonaReserva][nfilaReserva][nasientoReserva].ocupado == false) {
                PatioButacas.butacaReservada[zonaReserva][nfilaReserva][nasientoReserva].ocupado = true;
                i++;
            }
        }
        System.out.println("Reserva realizada correctamente . El importe total es: " + (numEntradas * precio) + " euros");
        pb.mostrarteatro(); //Aqui vuelvo a mostrar el teatro de nuevo, con la reserva AUTOMATICA
    }
    
    public  void reservamanual() {
        System.out.println("Introduzca el numero de entradas");
        int numentradas = teclado.nextInt();
        int i = 0;
        while (i < numentradas) {
            
            System.out.println("Indique zona 1 - 2");
            int zona = teclado.nextInt() - 1;
            
            System.out.println("Indique fila 1 - 9");
            int nfila = teclado.nextInt() - 1;
            
            System.out.println("Indique asiento 1 - 8");
            int nasiento = teclado.nextInt() - 1;
            
            if (zona >= 0 && zona <= 1 && nfila >= 0 & nfila <= 8 & nasiento >= 0 & nasiento <= 7) {
                if (PatioButacas.butacaReservada[zona][nfila][nasiento].ocupado == false) {
                    PatioButacas.butacaReservada[zona][nfila][nasiento].ocupado = true;
                    i++;
                } else {
                    System.out.println("BUTACA OCUPADA");
                }
            } else {
                System.out.println("RESERVA NO VÁLIDA");
            }
        }
        
        System.out.println("Reserva realizada correctamente . El importe total es: " + (numentradas * precio) + " euros");
        pb.mostrarteatro();//Aqui vuelvo a mostrar el teatro de nuevo, con la reserva MANUAL
    }
    
     public  void verreserva() {
        
        System.out.println("Introduce nombre ");
        String nombre = teclado.next();
        
        System.out.println("Introduce apellidos");
        String apellido = teclado.next();
        
        System.out.println("Introduce DNI");
        String dni = teclado.next();
        
        Reserva r = new Reserva(01, nombre, apellido, dni, LocalDate.now(), precio);
        System.out.println(r);
    }  
}
