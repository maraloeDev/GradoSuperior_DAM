/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */

package com.gf.app.covid.dao;

import com.gf.app.covid.models.Sintomas;
import com.gf.app.covid.utils.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;

public class SintomasDAO {

    public static int insert(Sintomas s) throws SQLException {
        String SQL = "INSERT INTO sintomas values(?,?,?,?,?,?)";
        try (Connection conn = ConexionBD.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(SQL);
            ps.setInt(1, s.getId());
            ps.setInt(2, s.getFiebre());
            ps.setInt(3, s.getTos());
            ps.setInt(4, s.getDiarrea());
            ps.setInt(5, s.getDolor());
            ps.setInt(6, s.getOlfato());
            return ps.executeUpdate();
        }
    }

    public static int update(Sintomas s) throws SQLException {
        String SQL = "UPDATE sintomas set(fiebre=?,tos=?,diarrea=?,dolor=?,olfato=? WHERE id=?)";
        try (Connection conn = ConexionBD.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(SQL);
            ps.setInt(1, s.getFiebre());
            ps.setInt(2, s.getTos());
            ps.setInt(3, s.getDiarrea());
            ps.setInt(4, s.getDolor());
            ps.setInt(5, s.getOlfato());
            ps.setInt(6, s.getId());
            return ps.executeUpdate();
        }
    }

    public static boolean selectID(Sintomas s) throws SQLException {
        boolean exist = false;
        String SQL = "SELECT * FROM sintomas WHERE id=?";
        try (Connection conn = ConexionBD.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(SQL);
            ps.setInt(1, s.getId());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                exist = true;
            }
        }
        return exist;
    }
    
    public static Set<Sintomas> select(Sintomas s) throws SQLException{
        String SQL = "SELECT * FROM sintomas";
        Set<Sintomas> list;
        try (Connection conn = ConexionBD.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(SQL);
            list = (Set<Sintomas>) ps.executeQuery();
        }
        return list;
    }

    public static int delete(Sintomas s) throws SQLException{
        String SQL = "DELETE * FROM sintomas";
        Set<Sintomas> list;
        PreparedStatement ps;
        try (Connection conn = ConexionBD.getConnection()) {
            ps = conn.prepareStatement(SQL);
            ps.setInt(1, s.getId());
        }
        return ps.executeUpdate();
    }
}
