/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ExamenJunio.Problema3;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Eduardo
 */
public class Problema3 {

    static Connection con;
    static String url = "jdbc:mysql://localhost:3306/programacion2223";
    static String user = "root";
    static String password = "";

    public static void main(String[] args) {

        try {
            con = DriverManager.getConnection(url, user, password);
            System.out.println("BD conectada");
            FileReader fr = null;
            try {
                fr = new FileReader("src\\main\\java\\ExamenJunio\\Problema3\\notas.txt");
            } catch (FileNotFoundException ex) {
                Logger.getLogger(Problema3.class.getName()).log(Level.SEVERE, null, ex);
            }
            BufferedReader br = new BufferedReader(fr);

            String linea;
            try {
                while ((linea = br.readLine()) != null) {
                    String separador[] = linea.split(":");

                    int id_alumno = Integer.parseInt(separador[0]);
                    double nota = Double.parseDouble(separador[1]);
                    if (nota>=5){
    
                    PreparedStatement pst = con.prepareCall("INSERT INTO aprobados (id_alumno, nota) VALUES(?,?)");

                    pst.setInt(1, id_alumno);
                    pst.setDouble(2, nota);
                    pst.executeUpdate();

                System.out.println("Datos volcados");
            }
}

            } catch (IOException ex) {
                Logger.getLogger(Problema3.class.getName()).log(Level.SEVERE, null, ex);
            }

        } catch (SQLException ex) {
            Logger.getLogger(Problema3.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
