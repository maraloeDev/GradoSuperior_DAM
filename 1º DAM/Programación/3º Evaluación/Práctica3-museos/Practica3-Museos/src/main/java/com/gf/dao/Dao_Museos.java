package com.gf.dao;

import com.gf.modelos.Museos;
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

public class Dao_Museos {
    public static List<Museos> getMuseos() {
        List<Museos> listaMuseos = new ArrayList<>();

        try (Connection conn = ConexionBD.getConn()) {
            Statement st = conn.createStatement();
            ResultSet rs;

            String sqlMuseos = "SELECT * FROM museos;";
            rs = st.executeQuery(sqlMuseos);
            while (rs.next()) {
                listaMuseos.add(new Museos(rs.getInt("id_museo"),
                        rs.getString("nombre_museo"),
                        rs.getInt("id_pais"),
                        rs.getBoolean("existe_museo")));
            }
        } catch (SQLException e) {
            System.out.println("Algo falló en la recuperación de datos de los museos");
            System.out.println(e.getMessage());
        } finally {
            ConexionBD.desconectarBD();
        }

        return listaMuseos;
    }
}
