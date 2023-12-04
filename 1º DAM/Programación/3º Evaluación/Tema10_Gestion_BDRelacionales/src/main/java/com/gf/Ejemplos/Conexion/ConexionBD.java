/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package com.gf.Ejemplos.Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class ConexionBD {
    
    public static void main(String[] args) {
        String  url = "jdbc:mysql://localhost:3306/prueba";
        //Conexion BD
        try {
            Connection con = DriverManager.getConnection(url, "root","");
            JOptionPane.showInternalMessageDialog(null, "Base da datos conectada correctamente");
        } catch (SQLException ex) {
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
            JOptionPane.showInternalMessageDialog(null, "Base da datos no conectada");
        }
    }
    
}
