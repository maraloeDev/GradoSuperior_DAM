/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package com.gf.patronsingleton;

/**
 *
 * @author maraloed
 */
public class Configurador {
    
    private String url;
    private String baseDatos;
    private static Configurador miConfigurador;

    public Configurador(String url, String baseDatos) {
        this.url = url;
        this.baseDatos = baseDatos;
    }
    
    public static Configurador getConfigurador(String url, String baseDatos){
        if(miConfigurador == null){
            miConfigurador = new Configurador(url, baseDatos);
            
        }
        return miConfigurador;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getBaseDatos() {
        return baseDatos;
    }

    public void setBaseDatos(String baseDatos) {
        this.baseDatos = baseDatos;
    }

    public static Configurador getMiConfigurador() {
        return miConfigurador;
    }

    public static void setMiConfigurador(Configurador miConfigurador) {
        Configurador.miConfigurador = miConfigurador;
    }
    
    
    
}
