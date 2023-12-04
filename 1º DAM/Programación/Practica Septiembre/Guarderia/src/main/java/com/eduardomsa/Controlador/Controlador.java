/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.eduardomsa.Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author Eduardo Martin-Sonseca
 */
public class Controlador {

    static Connection con;

    /*La URL que necesita el objeto para acceder a la base de datos es:
        //jdbc:mysql://localhost:3306/patitofeo.*/
    static final String URL = "jdbc:mysql://localhost:3306/patitofeo";

    /*Estos son el usuario y la contraseña
     con la que va a acceder el usuario para poder conectarse.*/
    static final String USER = "root";
    static final String PASSWORD = "";

    // Con este metodo, se crea conexión a la base de datos.
    public static void conexionBD() {
        try {
            //Este objeto se utiliza para conecctarse con la base de datos.
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            JOptionPane.showMessageDialog(null, "Base de datos conectada");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Base de datos no conectada");
        }
    }

    // Con este metodo, se desconecta de la base de datos.
    public static void desconexionBD() {
        try {
            con.close();
            JOptionPane.showMessageDialog(null, "Base de datos desconectada");
        } catch (SQLException ex) {
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
