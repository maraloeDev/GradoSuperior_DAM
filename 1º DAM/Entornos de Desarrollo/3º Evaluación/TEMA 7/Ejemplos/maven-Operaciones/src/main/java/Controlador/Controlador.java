/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package Controlador;

import Modelo.Suma;
import Vista.Vista;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JFrame;

/**
 *
 * @author maraloed
 */
public class Controlador implements ActionListener{
    
    private Suma modelo;
    private Vista vista;
    
    public Controlador(Suma modelo, Vista vista){
        this.modelo = modelo;
        this.vista = vista;
        this.vista.getSumabtn().addActionListener(this);
        this.vista.setTitle("Operaciones");
        this.vista.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.vista.setLocationRelativeTo(null);
        
    }

    @Override
    public void actionPerformed(ActionEvent e) {
     if(e.getSource() == vista.getSumabtn())    {
         modelo.setResultado();
         vista.setResultado(modelo.setResultado());
     }
    }
    
    
    
    
}
