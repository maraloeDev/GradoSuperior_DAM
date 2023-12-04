/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package com.gf.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class ConexionBD {

    //Establezco las variables como final para que no se modifique
    private static final String URL = "jdbc:mysql://localhost:3306/covid";
    private static final String USUARIO_BD = "root";
    private static final String PASSWORD_BD = "";

    public static void main(String[] args) {
        try {
            //Conexion BD

            Connection con = DriverManager.getConnection(URL, USUARIO_BD, PASSWORD_BD);
            JOptionPane.showMessageDialog(null, "Base de datos conectada correctamente");
        } catch (SQLException ex) {
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
            JOptionPane.showMessageDialog(null, "Base de datos no conectada");
        }
    }

}
