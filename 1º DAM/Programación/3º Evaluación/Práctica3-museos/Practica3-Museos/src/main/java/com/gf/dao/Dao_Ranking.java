package com.gf.dao;

import com.gf.modelos.Ranking;
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

public class Dao_Ranking {
    public static List<Ranking> getRanking() {
        List<Ranking> listaRanking = new ArrayList<>();

        try (Connection conn = ConexionBD.getConn()) {
            Statement st = conn.createStatement();
            ResultSet rs;

            String sqlRanking = "SELECT * FROM ranking;";
            rs = st.executeQuery(sqlRanking);
            while (rs.next()) {
                listaRanking.add(new Ranking(rs.getInt("id_ranking"),
                        rs.getString("nombre_jugador"),
                        rs.getInt("puntos_jugador")));
            }
        } catch (SQLException e) {
            System.out.println("Algo falló en la recuperación de datos del ranking");
            System.out.println(e.getMessage());
        } finally {
            ConexionBD.desconectarBD();
        }

        return listaRanking;
    }
}
