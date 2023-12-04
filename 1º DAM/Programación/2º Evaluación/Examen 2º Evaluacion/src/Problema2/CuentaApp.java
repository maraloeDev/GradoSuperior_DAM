package Problema2;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Eduardo Martin - Sonseca
 */
public class CuentaApp {

    public static void main(String[] args) {
        Cuenta cuenta1 = new Cuenta();
        CuentaCorriente cc1 = new CuentaCorriente();
        String opt = "";

        do {

            try {
                System.out.println("Introduce una opcion " + "\n"
                        + "1. Ingresar dinero" + "\n"
                        + "2. Retirar dinero" + "\n"
                        + "3. Saldo Actual" + "\n"
                        + "4. Cuenta corriente");

                opt = Cuenta.teclado.next();
                switch (opt) {
                    case "1":

                        cuenta1.ingresarDinero();
                        break;
                    case "2":
                        cuenta1.retirarDinero();
                        break;
                    case "3":
                        System.out.println(cuenta1.getSaldo_cuenta());
                        break;
                    case "4":
                        cc1.descubiertoCuenta();
                        break;
                }
                System.out.println("Quieres continular ? (S/N)");
                opt = Cuenta.teclado.next();

            } catch (Exception ex) {
                System.out.println("Opcion no contemplada");
            }
        } while (opt.equalsIgnoreCase("S"));
        System.out.println("Has salido");

    }

}
