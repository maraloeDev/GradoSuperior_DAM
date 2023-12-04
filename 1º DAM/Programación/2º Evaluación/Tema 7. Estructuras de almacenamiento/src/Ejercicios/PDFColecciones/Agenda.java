/*
 * * *****************************************************************************
 *  * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 *  *****************************************************************************
 */

package EjerciciosTEMA7.PDFColecciones;

import java.util.ArrayList;

public class Agenda {

    private ArrayList<Contacto> agenda = new ArrayList<>();

    public Agenda(int tamanio) {
        this.agenda = new ArrayList<>();
    }

    public void aniadirContacto(Contacto c) {
        agenda.add(c);
    }


    /*public void buscarContactoporNombre(Contacto c){
            int pos=agenda.indexOf(c);
            if (pos>=0){

                System.out.println("El elemento " + c + "esta en" + pos);

            } else{
                System.out.println("Contacto no encontrado");
            }

        }

        public void buscarContactoporTelefono(Contacto telefono){
            int pos=agenda.indexOf(telefono);
            if (pos>=0){

                System.out.println("El elemento " + telefono + "esta en" + pos);

            } else{
                System.out.println("telefono no encontrado");
            }*/
   /* public void modificarContacto(int telefono, Contacto c) {
        agenda.set(telefono, c);
    }*/

    public void eliminarContacto(Contacto c) {
        agenda.remove(c);
    }

    public void listaContactos() {

        System.out.println(agenda.toString());

    }

    public void vaciarAgenda() {
        agenda.removeAll(agenda);
        System.out.println("Contactos eliminados correctamente");
    }

}

