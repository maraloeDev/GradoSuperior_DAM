/*
 * * *****************************************************************************
 *  * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 *  *****************************************************************************
 */

package EjerciciosTEMA7.PDFColecciones;

public class Contacto {

    //Atributos
    private int id;
    private String nombre;
    private int tlfno;

    public Contacto(String nombre, int tlfno) {
        this.id = id;
        this.nombre = nombre;
        this.tlfno = tlfno;
    }

    public Contacto() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getTlfno() {
        return tlfno;
    }

    public void setTlfno(int tlfno) {
        this.tlfno = tlfno;
    }

    @Override
    public String toString() {
        return "Contacto " + "\n" +
                " Id = " + id +  "\n" +
                " Nombre ='" + nombre + "\n" +
                "Tlfno =" + tlfno;
    }
}
