package com.gf.dao;

import com.gf.modelos.Paises;
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

public class Dao_Paises {
    public static List<Paises> getPaises() {
        List<Paises> listaPaises = new ArrayList<>();

        try (Connection conn = ConexionBD.getConn()) {
            Statement st = conn.createStatement();
            ResultSet rs;

            String sqlPaises = "SELECT * FROM paises;";
            rs = st.executeQuery(sqlPaises);
            while (rs.next()) {
                listaPaises.add(new Paises(rs.getInt("id_pais"),
                        rs.getString("nombre_pais")));
            }
        } catch (SQLException e) {
            System.out.println("Algo falló en la recuperación de datos de los países");
            System.out.println(e.getMessage());
        } finally {
            ConexionBD.desconectarBD();
        }

        return listaPaises;
    }
}
