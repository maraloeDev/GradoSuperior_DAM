/*
 * * *****************************************************************************
 *  * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 *  *****************************************************************************
 */

package EjerciciosTEMA7.PDFColecciones;

import java.util.Scanner;

public class AgendaApp {
    public static void main(String[] args) {

        Scanner teclado = new Scanner(System.in);
        Agenda agenda = new Agenda(5);
    int opt;
        do {
        System.out.println("Que quiere hacer con la agenda" + "\n" +
                "1. Añadir un contacto" + "\n" +
                "2. Buscar Contacto" + "\n" +
                "3. Modificar los datos de un contacto" + "\n" +
                "4. Eliminar un contacto" + "\n" +
                "5. Mostrar listado de contactos" + "\n" +
                "6. Vaciar agenda");
         opt = teclado.nextInt();

            switch (opt) {
                case 1:
                    System.out.println("Indique un nombre: ");
                    String nombre = teclado.next();

                    System.out.println("Indique un telefono :");
                    int telefono = teclado.nextInt();

                    Contacto contacto = new Contacto(nombre, telefono);
                    agenda.aniadirContacto(contacto);

                    System.out.println("Contacto agregado correctamente");
                    break;

                case 2:

                    break;

                case 3:

                    break;

                case 4 :
                    System.out.println("Indique un nombre a eliminar: ");
                    String nombreEliminar = teclado.next();

                    System.out.println("Indique un telefono a eliminar: ");
                    int telefonoEliminar = teclado.nextInt();

                    Contacto contacto2 = new Contacto(nombreEliminar,telefonoEliminar);
                    agenda.eliminarContacto(contacto2);
                    break;

                case 5 :
                    agenda.listaContactos();
                    break;

                case 6 :
                    agenda.vaciarAgenda();
                    break;

            }

        } while (opt != 6);
    }
}
