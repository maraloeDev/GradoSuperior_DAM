/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ExamenJunio.Problema1;

/**
 *
 * @author Eduardo
 */
public class Automovil {
    
    private String matricula;
    private String marca;
    private String modelo;
    private int potencia;
    private double deposito;
    private boolean arrancado;
    private int velocidad;
    private int velocidadMaxima;
    private double capacidadDeposito;
    private int capacidad;

    public Automovil(String matricula, int velocidadMaxima, double capacidadDeposito) {
        this.matricula = matricula;
        this.velocidadMaxima = velocidadMaxima;
        this.capacidadDeposito = capacidadDeposito;
        this.arrancado = false;
        this.velocidad = 0;
    }

    public void arrancar() {
        if (!arrancado) {
            arrancado = true;
            System.out.println("El automóvil ha sido arrancado.");
        } else {
            System.out.println("El automóvil ya está arrancado.");
        }
    }

    public void parar() {
        if (arrancado) {
            arrancado = false;
            velocidad = 0;
            System.out.println("El automóvil ha sido detenido.");
        } else {
            System.out.println("El automóvil ya está detenido.");
        }
    }

    public void repostar() {
        deposito = capacidadDeposito;
        System.out.println("El depósito ha sido repostado. Cantidad de gasolina: " + deposito + " litros.");
    }

    public void acelerar() {
        if (arrancado) {
            if (velocidad + 10 <= velocidadMaxima) {
                velocidad += 10;
                deposito -= 0.5;
                System.out.println("Acelerando a " + velocidad + " km/h. Gasolina restante: " + deposito + " litros.");
            } else {
                System.out.println("No se puede acelerar más allá de la velocidad máxima.");
            }
        } else {
            System.out.println("El automóvil no está arrancado.");
        }
    }

    public void decelerar() {
        if (arrancado) {
            if (velocidad > 5) {
                velocidad -= 5;
                System.out.println("Decelerando a " + velocidad + " km/h.");
            } else {
                System.out.println("No se puede decelerar más.");
            }
        } else {
            System.out.println("El automóvil no está arrancado.");
        }
    }

    public void entrar() {
        if (capacidad < 5) {
            capacidad++;
            System.out.println("Una persona ha entrado al automóvil. Capacidad actual: " + capacidad + " personas.");
        } else {
            System.out.println("El automóvil está lleno, no se puede ingresar más personas.");
        }
    }

    public void salir() {
        if (capacidad > 0) {
            capacidad--;
            System.out.println("Una persona ha salido del automóvil. Capacidad actual: " + capacidad + " personas.");
        } else {
            System.out.println("No hay personas en el automóvil.");
        }
    }

    @Override
    public String toString() {
        return "Estado del automóvil:\nVelocidad: " + velocidad + " km/h\nCapacidad: " + capacidad +
                " personas\nCantidad de gasolina: " + deposito + " litros";
    }
    
}
