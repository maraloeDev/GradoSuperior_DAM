/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gf.app.parque.logic;

import com.gf.app.parque.dao.AdministradorDAO;
import com.gf.app.parque.entities.Administrador;
import java.sql.SQLException;

/**
 * AdministradorLogic: clase que permite aplicar la logica de negocio y acceder
 * a la base de datos, en concreto la tabla 'administrador'.
 *
 * @author priparno
 */
public class AdministradorLogic {

    /**
     * adminDAO: objeto de acceso a datos de administrador.
     */
    private AdministradorDAO adminDAO = new AdministradorDAO();

    /**
     * DEFAULT CONSTRUCTOR
     */
    public AdministradorLogic() {
    }

    /**
     * update: actualiza el administrador cuyo dni sea el pasado por parametro y
     * actualiza su contraseña.
     *
     * @see AdministradorDAO
     * @see Administrador
     *
     * @param dni una cadena que representa el dni
     * @param newPass una cadena que representa la nueva contraseña
     * @return true -> se ha actualizado, false -> no se ha actualizado
     * @throws SQLException si no consigue acceder a la base de datos (error
     * sintactico o base de datos no encontrada)
     */
    public boolean update(String dni, String newPass) throws SQLException {
        Administrador a = adminDAO.selectDNI(dni);
        if (newPass.length() < 8) {
            return false;
        }
        a.setPassword_admin(newPass);
        return adminDAO.updateId(a) > 0; //lanza false si no se actualiza
    }

    /**
     * selectDni: recoge el administrador cuyo dni es el pasado por parametro.
     *
     * @see AdministradorDAO
     * @see Administrador
     *
     * @param dni una cadena que representa el dni
     * @return un objeto administrador
     * @throws SQLException si no consigue acceder a la base de datos (error
     * sintactico o base de datos no encontrada)
     */
    public Administrador selectDni(String dni) throws SQLException {
        return adminDAO.selectDNI(dni);
    }

}
