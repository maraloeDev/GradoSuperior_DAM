package com.gf.utilidades;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author Eduardo Martín-Sonseca y Mario Ortuñez
 */
public class ConexionBD {

    public static Connection conn;
    public static String url = "jdbc:mysql://localhost:3306/dim_gf";
    public static final String USER_SQL = "root";
    public static final String PASSWORD_SQL = "";

    /*Metodo que sirve para conectarse con la base de datos utilizando el objeto 
    Connection y pasando los metodos estaticos desde la linea 17 a la 19 para
    la conexion*/
    public static void conectarBD() {
        try {
            conn = DriverManager.getConnection(url, USER_SQL, PASSWORD_SQL);
            System.out.println("Se conecto");
        } catch (SQLException ex) {
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
            JOptionPane.showMessageDialog(null, "Base de datos no conectada");
        }
    }

    //Metodo que sirve para cerrar la conexion con la base de datos
    public static void desconectarBD() {
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static Connection getConn() {
        conectarBD();
        return conn;
    }
}
