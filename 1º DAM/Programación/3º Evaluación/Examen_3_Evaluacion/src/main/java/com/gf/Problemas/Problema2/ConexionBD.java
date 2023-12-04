/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.Problema2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author maraloed
 */
public class ConexionBD {
    
    public static final String  URL = "jdbc:mysql://localhost:3306/junio2023";
    public static final String  USUARIO = "root";
    public static final String  PASSWORD = "";
    static Connection con;
    
    public static void main(String[] args) {
        try {
            con = DriverManager.getConnection(URL, USUARIO, PASSWORD);
            JOptionPane.showMessageDialog(null, "BD Conectada correctamente");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "BD no conectada correctamente");
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
