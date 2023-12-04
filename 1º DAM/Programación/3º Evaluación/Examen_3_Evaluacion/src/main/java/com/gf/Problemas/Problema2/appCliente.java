/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.Problema2;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author maraloed
 */
public class appCliente {
    
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        System.out.println("Seleccione una opcion A o B");
        /* Eleccion por teclado 
        (Pongo toUpperCase si introduce una a o b minus,
        que lo detecte el programa como mayus)*/
        String opt = teclado.next().toUpperCase(); 
        
        switch(opt){
            case "A" :
                
                String sql= "SELECT * FROM MOVIMIENTOS";
                Statement st;
                ResultSet rs;
            try {
                st = ConexionBD.con.createStatement(); //Creo un statement con la consulta generada
            } catch (SQLException ex) {
                Logger.getLogger(appCliente.class.getName()).log(Level.SEVERE, null, ex);
            }
            {
               // try {
                    //rs = st.executeQuery(sql); //Ejecuto la sentencia SQL
               // } catch (SQLException ex) {
                 //   Logger.getLogger(appCliente.class.getName()).log(Level.SEVERE, null, ex);
               // }
            }
                break;

            case "B" :
                break;
            default:
                System.err.println("Opcion no contemplada");
                main(null);
        }
    }
    
}
