/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gf.app.parque.logic;

import com.gf.app.parque.dao.MenuDAO;
import com.gf.app.parque.entities.Menu;
import java.sql.SQLException;
import java.util.List;

/**
 * MenuLogic: clase que permite aplicar la logica de negocio y acceder a la base
 * de datos, en concreto la tabla 'menu'.
 *
 * @author priparno
 */
public class MenuLogic {

    /**
     * menuDAO: objeto de acceso a datos de menu.
     */
    private MenuDAO menuDAO = new MenuDAO();

    /**
     * DEFAULT CONSTRUCTOR
     */
    public MenuLogic() {
    }

    /**
     * select: permite seleccionar todos los menus de la base de datos.
     *
     * @see MenuDAO
     * @see Menu
     *
     * @return una lista de menus
     * @throws SQLException si no consigue acceder a la base de datos (error
     * sintactico o base de datos no encontrada)
     */
    public List<Menu> select() throws SQLException {
        return menuDAO.selectAll();
    }

}
