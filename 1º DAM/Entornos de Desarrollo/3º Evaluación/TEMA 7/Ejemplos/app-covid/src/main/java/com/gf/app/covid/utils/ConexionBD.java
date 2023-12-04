/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package com.gf.app.covid.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {

    private static Connection conn;
    private static final String MYSQL_DB_URL = "jdbc:mysql://localhost:3306/covid";
    private static final String MYSQL_USER = "root";
    private static final String MYSQL_PASSWD = "";

    public static Connection getConnection() throws SQLException {
        conn = DriverManager.getConnection(MYSQL_DB_URL, MYSQL_USER, MYSQL_PASSWD);
        return conn;

    }
}
