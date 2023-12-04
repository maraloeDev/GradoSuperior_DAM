/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package com.gf.vistas;

import com.gf.controles.Juego2;
import com.gf.dao.Dao;
import com.gf.modelos.Museos;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.util.List;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

/**
 *
 * @author Eduardo Martín-Sonseca y Mario Ortuñez
 */
public class GUI_Juego2 extends javax.swing.JFrame {

    /*Se declaran las siguientes variables, como 
    * dao Creo un atributo que hereda de la clase DAO
    
    * juego2 Creo un atributo que hereda de la clase Juego2 (com.gf.controles)
    
    * MAX_SELECTIONS Delimita el número máximo de selecciones permitidas en el CB
    
    * currentSelections Contador de selecciones actuales
    
    * panelContenedor Establesco el GridLayOut Para ponerlo en filas los museos
    
    * btnComprobar Boton para comprobar si los museos seleccionados son verdaderos
     */
    private static final Dao dao = new Dao();
    private static final Juego2 juego2 = new Juego2(dao);
    private static final int MAX_SELECTIONS = 3;
    private int currentSelections = 0;
    JPanel panelContenedor = new JPanel(new GridLayout(0, 1));
    JButton btnComprobar = new JButton("Comprobar");
    private static JCheckBox checkbox;

    public GUI_Juego2() {
        initComponents();
        setFrame();
        creacion();

    }

    /* El siguiente metodo configura : 
    * la apariencia y el diseño de la ventana actual
    * Establezco el título a la ventana
    * La ubicación de donde se va a situar al ventana al ejecutar
    * El tamaño de la ventana
    * También agrego un ActionListener al botón btnComprobar.*/
    private void setFrame() {
        this.setTitle("Verdadero/Falso de Museos");
        this.setContentPane(panelContenedor);
        this.setLocationRelativeTo(null);
        this.setPreferredSize(new Dimension(500, 500));
        this.setContentPane(panelContenedor);

        btnComprobar.addActionListener((ActionEvent e) -> {
            comprobarSeleccionados();
        });
    }

    /*El siguiente metodo crea :
    / Los elementos de la interfaz de usuario,(JCheckBox) para cada nombre de museo obtenido a través de juego2.getNombresMuseos()
    * Cada caja de verificación tiene un ActionListener adjunto que realiza un seguimiento de la cantidad de selecciones realizadas 
    * Deshabilito las demás cajas de verificación cuando se alcanza el límite máximo (MAX_SELECTIONS (En este caso 3)
    * También agrego el botón btnComprobar al panel contenedor para que se muestre en la ventana. */
    private void creacion() {
        // Obtener los nombres de las obras de arte desde la base de datos
        List<Museos> nombresObrasArte = dao.getMuseos();

        for (String museo : juego2.getNombresMuseos()) {
            JCheckBox checkBoxMuseo = new JCheckBox(museo);
            panelContenedor.add(checkBoxMuseo);

            checkBoxMuseo.addActionListener((ActionEvent e) -> {
                JCheckBox selectedCheckbox = (JCheckBox) e.getSource();
                String nombreObraArte = selectedCheckbox.getText();

                if (selectedCheckbox.isSelected()) {
                    currentSelections++;
                    if (currentSelections >= MAX_SELECTIONS) {
                        disableRemainingCheckboxes();
                    }
                } else {
                    currentSelections--;
                    enableAllCheckboxes();
                }

            });
            panelContenedor.add(btnComprobar);
        }
    }

    /* El siguiente metodo deshabilita :
    * Las cajas de verificación restantes que no están seleccionadas.*/
    private void disableRemainingCheckboxes() {
        Component[] components = panelContenedor.getComponents();
        for (Component component : components) {
            if (component instanceof JCheckBox) {
                JCheckBox checkbox = (JCheckBox) component;
                if (!checkbox.isSelected()) {
                    checkbox.setEnabled(false);
                }
            }
        }
    }

    /* El siguiente metodo
    *Habilita todas las cajas de verificación.*/
    private void enableAllCheckboxes() {
        Component[] components = panelContenedor.getComponents();
        for (Component component : components) {
            if (component instanceof JCheckBox) {
                JCheckBox checkbox = (JCheckBox) component;
                checkbox.setEnabled(true);
            }
        }
    }

    /* El siguiente metodo
    * verifica qué los JcheckBox estan seleccionados
    * establecimiento de su fondo en verde si están seleccionadas o en su color original si no lo están.*/
    private void comprobarSeleccionados() {
        Component[] components = panelContenedor.getComponents();
        for (Component component : components) {
            if (component instanceof JCheckBox) {
                checkbox = (JCheckBox) component;
            }
        }
        /* La validación la saco del for
                    para que cuando se clique en el boton comprobar no me lo repita
                    las veces que se ha seleccionado el chekkBox*/
        JOptionPane.showMessageDialog(null, "Los cuadros seleccionados  son correctos");

    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 400, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(GUI_Juego2.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(GUI_Juego2.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(GUI_Juego2.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(GUI_Juego2.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new GUI_Juego2().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables
}
