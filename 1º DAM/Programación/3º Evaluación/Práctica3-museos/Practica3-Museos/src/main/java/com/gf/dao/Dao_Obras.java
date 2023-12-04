package com.gf.dao;

import com.gf.modelos.Obras;
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

public class Dao_Obras {
    public static List<Obras> getObras() {
        List<Obras> listaObras = new ArrayList<>();

        try (Connection conn = ConexionBD.getConn()) {
            Statement st = conn.createStatement();
            ResultSet rs;

            String sqlObras = "SELECT * FROM obras;";
            rs = st.executeQuery(sqlObras);
            while (rs.next()) {
                listaObras.add(new Obras(rs.getInt("id_obra"),
                        rs.getString("nombre_obra"),
                        rs.getString("descripción_obra"),
                        rs.getString("disciplina"),
                        rs.getInt("id_museo"),
                        rs.getInt("id_autor")));
            }
        } catch (SQLException e) {
            System.out.println("Algo falló en la recuperación de datos de las obras");
            System.out.println(e.getMessage());
        } finally {
            ConexionBD.desconectarBD();
        }

        return listaObras;
    }
}
