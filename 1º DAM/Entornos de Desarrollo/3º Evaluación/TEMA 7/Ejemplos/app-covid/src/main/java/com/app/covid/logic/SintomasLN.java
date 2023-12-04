/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package com.app.covid.logic;

import com.gf.app.covid.dao.SintomasDAO;
import com.gf.app.covid.models.Sintomas;
import java.sql.SQLException;

/**
 *
 * @author maraloed
 */
public class SintomasLN {
    
     public static String insertar(Sintomas s) throws SQLException {
         
         if(SintomasDAO.selectID(s)){
             SintomasDAO.delete(s);
             return "Los resultados de test se han guardado";
         } else{
             return "El test ya existe";
         }
        
    }
     
     public static String delete(Sintomas s) throws SQLException {
         
         if(SintomasDAO.selectID(s)){
             SintomasDAO.insert(s);
             return "Los resultados de test se han guardado";
         } else{
             return "El test no existe";
         }
        
    }
     
     public static String update(Sintomas s) throws SQLException {
         
         if(SintomasDAO.selectID(s)){
             SintomasDAO.update(s);
             return "Los resultados de test se han guardado";
         } else{
             return "El test no existe";
         }
        
    }
    
}
