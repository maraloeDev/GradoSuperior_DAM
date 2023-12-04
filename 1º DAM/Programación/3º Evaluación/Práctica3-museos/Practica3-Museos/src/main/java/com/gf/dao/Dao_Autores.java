package com.gf.dao;

import com.gf.modelos.Autores;
import com.gf.utilidades.ConexionBD;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Eduardo Martín-Sonseca y Mario Ortuñez
 */

public class Dao_Autores {
    
    
    public static List<Autores> getAutores() {
        List<Autores> listaAutores = new ArrayList<>();

        try (Connection conn = ConexionBD.getConn()) {
            Statement st = conn.createStatement();
            ResultSet rs;

            String sqlAutores = "SELECT * FROM autores;";
            rs = st.executeQuery(sqlAutores);
            while (rs.next()) {
                listaAutores.add(new Autores(rs.getInt("id_autor"),
                        rs.getString("nombre_autor"),
                        rs.getInt("id_pais")));
            }
        } catch (SQLException e) {
            System.out.println("Algo falló en la recuperación de datos de los autores");
            System.out.println(e.getMessage());
        } finally {
            ConexionBD.desconectarBD();
        }

        return listaAutores;
    }
}
