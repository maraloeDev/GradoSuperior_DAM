/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package com.gf.ed_t7_act7_patron_singleton;

/**
 *
 * @author maraloed
 */
public class AppSoyUnico {
    public static void main(String[] args) {
        SoyUnico.getSingletonInstance("DAM");
        SoyUnico.getSingletonInstance("DAM");
    }
    
}
