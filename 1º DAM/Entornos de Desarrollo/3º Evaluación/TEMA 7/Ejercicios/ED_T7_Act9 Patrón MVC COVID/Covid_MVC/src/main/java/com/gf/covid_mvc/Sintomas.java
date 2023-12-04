/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package com.gf.covid_mvc;

public class Sintomas {
    
    private Integer fiebre;
    private Integer tosSeca;
    private Integer diarrea;
    private Integer dolorMuscular;
    private Integer olfato;

    public Sintomas() {
    }

    public int getFiebre() {
        return fiebre;
    }

    public void setFiebre(int fiebre) {
        this.fiebre = fiebre;
    }

    public int getTosSeca() {
        return tosSeca;
    }

    public void setTosSeca(int tosSeca) {
        this.tosSeca = tosSeca;
    }

    public int getDiarrea() {
        return diarrea;
    }

    public void setDiarrea(int diarrea) {
        this.diarrea = diarrea;
    }

    public int getDolorMuscular() {
        return dolorMuscular;
    }

    public void setDolorMuscular(int dolorMuscular) {
        this.dolorMuscular = dolorMuscular;
    }

    public int getOlfato() {
        return olfato;
    }

    public void setOlfato(int olfato) {
        this.olfato = olfato;
    }
    
    

}
