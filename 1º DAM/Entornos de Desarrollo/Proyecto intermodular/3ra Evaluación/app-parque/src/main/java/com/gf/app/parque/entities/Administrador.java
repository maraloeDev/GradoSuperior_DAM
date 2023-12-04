/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gf.app.parque.entities;

import java.util.Objects;

/**
 * Administrador: representa un administrador/trabajador de la base de datos.
 *
 * @author priparno
 */
public class Administrador {

    /**
     * dni_admin: el dni del administrador.
     */
    private String dni_admin;
    /**
     * nombre_admin: el nombre del trabajador.
     */
    private String nombre_admin;
    /**
     * apellidos_admin: los apellidos del trabajador.
     */
    private String apellidos_admin;
    /**
     * telefono_admin: el telefono del trabajador.
     */
    private String telefono_admin;
    /**
     * correo_admin: el correo del trabajador.
     */
    private String correo_admin;
    /**
     * puesto_admin: el puesto del trabajador.
     */
    private String puesto_admin;
    /**
     * password_admin: es la contrasenia del trabajador.
     */
    private String password_admin;

    /**
     * getDni_admin: devuelve una cadena que representa el dni del trabajador.
     * Es la clave primaria.
     *
     * @return una cadena
     */
    public String getDni_admin() {
        return dni_admin;
    }

    /**
     * setDni_admin: actualiza el dni con la cadena pasada por parametro.
     *
     * @param dni_admin una cadena que representa el dni del trabajador
     */
    public void setDni_admin(String dni_admin) {
        this.dni_admin = dni_admin;
    }

    /**
     * getNombre_admin: devuelve una cadena con el nombre del trabajador.
     *
     * @return una cadena
     */
    public String getNombre_admin() {
        return nombre_admin;
    }

    /**
     * setNombre_admin: actualiza el nombre con la cadena pasada por parametro.
     *
     * @param nombre_admin una cadena que representa el nombre del trabajador.
     */
    public void setNombre_admin(String nombre_admin) {
        this.nombre_admin = nombre_admin;
    }

    /**
     * getApellidos_admin: devuelve una cadena con los apellidos del trabajador.
     *
     * @return una cadena
     */
    public String getApellidos_admin() {
        return apellidos_admin;
    }

    /**
     * setApellidos_admin: actualiza los apellidos con la cadena pasada por
     * parametro.
     *
     * @param apellidos_admin una cadena que representa los apellidos del
     * trabajador.
     */
    public void setApellidos_admin(String apellidos_admin) {
        this.apellidos_admin = apellidos_admin;
    }

    /**
     * getTelefono_admin: devuelve una cadena que representa el telefono del
     * trabajador.
     *
     * @return una cadena
     */
    public String getTelefono_admin() {
        return telefono_admin;
    }

    /**
     * setTelefono_admin: actualiza el telefono del trabajador con la cadena
     * pasada por parametro.
     *
     * @param telefono_admin una cadena que representa el telefono del
     * trabajador
     */
    public void setTelefono_admin(String telefono_admin) {
        this.telefono_admin = telefono_admin;
    }

    /**
     * getCorreo_admin: devuelve una cadena que representa el correo del
     * trabajador.
     *
     * @return una cadena
     */
    public String getCorreo_admin() {
        return correo_admin;
    }

    /**
     * setCorreo_admin: actualiza el correo del trabajador con la cadena pasada
     * por parametro.
     *
     * @param correo_admin una cadena que representa el correo del trabajador.
     */
    public void setCorreo_admin(String correo_admin) {
        this.correo_admin = correo_admin;
    }

    /**
     * getPuesto_admin: devuelve una cadena que representa el puesto del
     * trabajador.
     *
     * @return una cadena
     */
    public String getPuesto_admin() {
        return puesto_admin;
    }

    /**
     * setPuesto_admin: actualiza el puesto del trabajador con la cadena pasada
     * como parametro.
     *
     * @param puesto_admin una cadena que representa el puesto
     */
    public void setPuesto_admin(String puesto_admin) {
        this.puesto_admin = puesto_admin;
    }

    /**
     * getPassword_admin: devuelve una cadena con la contrasenia del trabajador.
     *
     * @return una cadena
     */
    public String getPassword_admin() {
        return password_admin;
    }

    /**
     * setPassword_admin: actualiza la contrasenia del trabajador con la pasada
     * por parametro.
     *
     * @param password_admin una cadena que representa la contrasenia del
     * trabajador
     */
    public void setPassword_admin(String password_admin) {
        this.password_admin = password_admin;
    }

    /**
     * toString: devuelve una cadena con la informacion del trabajador.
     *
     * @return una cadena
     */
    @Override
    public String toString() {
        return "Administrador(" + dni_admin + "): Nombre y apellidos=" + nombre_admin + " " + apellidos_admin + ", telefono=" + telefono_admin + ", correo=" + correo_admin + ", puesto=" + puesto_admin;
    }

    /**
     * equals: compara dos objetos, si son el mismo devuelve true y si no
     * devuelve false.
     *
     * @param admin un objeto de tipo admin con el que se compara
     * @return true -> es el mismo, false -> es distinto
     */
    @Override
    public boolean equals(Object admin) {
        if (this == admin) {
            return true;
        }
        if (admin == null) {
            return false;
        }
        if (getClass() != admin.getClass()) {
            return false;
        }
        final Administrador other = (Administrador) admin;
        if (!Objects.equals(this.dni_admin, other.dni_admin)) {
            return false;
        }
        if (!Objects.equals(this.nombre_admin, other.nombre_admin)) {
            return false;
        }
        if (!Objects.equals(this.apellidos_admin, other.apellidos_admin)) {
            return false;
        }
        if (!Objects.equals(this.telefono_admin, other.telefono_admin)) {
            return false;
        }
        if (!Objects.equals(this.correo_admin, other.correo_admin)) {
            return false;
        }
        if (!Objects.equals(this.puesto_admin, other.puesto_admin)) {
            return false;
        }
        return Objects.equals(this.password_admin, other.password_admin);
    }

}
