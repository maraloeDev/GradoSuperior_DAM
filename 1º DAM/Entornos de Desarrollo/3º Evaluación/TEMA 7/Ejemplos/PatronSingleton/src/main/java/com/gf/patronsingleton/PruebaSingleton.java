/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package com.gf.patronsingleton;

/**
 *
 * @author maraloed
 */
public class PruebaSingleton {
    
    public static void main(String[] args) {
        Configurador c = Configurador.getConfigurador("CASA", "baseDatos");
        
        c.getUrl();
        c.getBaseDatos();
    }
    
}
