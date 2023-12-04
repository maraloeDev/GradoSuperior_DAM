/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package Lampara;

/**
 *
 * @author Eduardo Martin-Sonseca (maraloedev)
 */
public class Lampara {
    
    private boolean encendida;

    public boolean isEncendida() {
        return encendida;
    }
    
    public void encender(){
        encendida = true;
    }
    
    public void apagar(){
        encendida = false;
    }
    public static void main(String[] args) {
        Lampara lampara = new Lampara();
        System.out.println(lampara.encendida);
    }
    
}
