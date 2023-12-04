/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gf.app.parque.dao;

import com.gf.app.parque.entities.Menu;
import com.gf.app.parque.resources.ConexionBD;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * MenuDAO: es la clase de acceso a datos de la base de datos, en concreto la
 * tabla 'menu'.
 *
 * @author priparno
 */
public class MenuDAO {

    /**
     * DEFAULT CONSTRUCTOR
     */
    public MenuDAO() {
    }

    /**
     * selectAll: selecciona todos los menus de la base de datos.
     *
     * @see Menu
     * 
     * @return devuelve una lista de menus
     * @throws SQLException si no consigue acceder a la base de datos (error
     * sintactico o base de datos no encontrada)
     */
    public List<Menu> selectAll() throws SQLException {
        List<Menu> fullList = new ArrayList<>();
        try ( Connection con = ConexionBD.getConnection()) {
            String sql = "SELECT * FROM menu";
            Statement s = con.createStatement();
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                Menu menu = new Menu();
                menu.setId_menu(rs.getInt("id_menu"));
                menu.setNombre_menu(rs.getString("nombre_menu"));
                menu.setPrecio_menu(rs.getDouble("precio_menu"));
                fullList.add(menu);
            }
        }
        return fullList;
    }

}
