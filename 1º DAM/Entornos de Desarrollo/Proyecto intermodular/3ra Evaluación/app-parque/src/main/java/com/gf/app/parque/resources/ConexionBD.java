/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gf.app.parque.resources;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 * ConexionBD: es la clase que permite la conexion con la base de datos.
 *
 * @author priparno
 */
public class ConexionBD {

    /**
     * con: tipo Connection que representa la conexion con la base de datos.
     */
    private static Connection con;

    /**
     * URL: constante que refleja la url de la base de datos.
     */
    private static final String URL = "jdbc:mysql://localhost:3306/parque_bolas";
    /**
     * USER: constante que indica el usuario.
     */
    private static final String USER = "root";
    /**
     * PASSWD: constante que indica la contrasenia.
     */
    private static final String PASSWD = "";

    /**
     * getConnection: es el metodo que conecta con la base de datos y devuelve
     * la conexion.
     *
     * @see Connection
     *
     * @return un objeto de tipo Connection
     * @throws java.sql.SQLException si no consigue acceder a la base de datos
     * (base de datos no encontrada)
     */
    public static Connection getConnection() throws SQLException {
        con = DriverManager.getConnection(URL, USER, PASSWD);
        return con;
    }

    /**
     * isValid: si no permite la conexion con la base de datos no permite lanzar
     * la aplicacion.
     *
     * @return true -> la conexion es valida, false -> la conexion no es valida
     */
    public static boolean isValid() {
        try {
            getConnection();
            if (con != null) {
                return true;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error al acceder a la base de datos.", "Error", JOptionPane.ERROR_MESSAGE);
        }
        return false;
    }

}
