/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package com.gf.ed_t7_act7_patron_singleton;

/**
 *
 * @author maraloed
 */
public class SoyUnico {
        private String nombre;
        private static SoyUnico su;

    private SoyUnico(String nombre) {
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public static SoyUnico getSingletonInstance(String nombre){
        
        if(su == null){
            su = new SoyUnico(nombre);
            System.out.println("No se ha creado");
            
        } else{
            System.out.println("El objeto ya existe");
        }
        return su;
    }

    public static void setSu(SoyUnico su) {
        SoyUnico.su = su;
    }


    
}
