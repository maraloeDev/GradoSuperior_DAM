/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.eduardomsa.Modelo;

/**
 *
 * @author Eduardo Martín-Sonseca
 */
public class Cuentas {

    // Atributos
    private int id_cuenta;
    private String login;
    private String password;
    private int familia;

    // Constructores
    public Cuentas(int id_cuenta, String login, String password, int familia) {
        this.id_cuenta = id_cuenta;
        this.login = login;
        this.password = password;
        this.familia = familia;
    }

    // Getter y Setter
    public int getId_cuenta() {
        return id_cuenta;
    }

    public void setId_cuenta(int id_cuenta) {
        this.id_cuenta = id_cuenta;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getFamilia() {
        return familia;
    }

    public void setFamilia(int familia) {
        this.familia = familia;
    }

    // toString
    @Override
    public String toString() {
        return "Cuentas{"
                + "id_cuenta=" + id_cuenta
                + ", login=" + login
                + ", password=" + password
                + ", familia=" + familia + '}';
    }

}
