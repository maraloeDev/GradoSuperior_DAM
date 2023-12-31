/** *****************************************************************************
 * Copyright (C) EDUARDO MARTÍN-SONSECA (maraloeDev)
 ***************************************************************************** */
package Ejercicio_1;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.Collections;
import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JPasswordField;

/**
 *
 * @author marti
 */
public final class Ejercicio_1_PIN extends javax.swing.JFrame {

    private JPanel panelContenedorBotones;
    private JPanel panelContenedorPasswrd;
    private JButton button;
    private JPasswordField jPasswordField;
    boolean ver = false;

    /**
     * Creates new form Ejercicio_1_PIN
     */
    public Ejercicio_1_PIN() {
        initComponents();
        setFrame();
        crearControles();
    }

    private void setFrame() {
        panelContenedorBotones = new JPanel(new FlowLayout());
        panelContenedorPasswrd = new JPanel(new FlowLayout());

        //Establezco un titulo a la ventana, una dimension (Alto y Ancho), centro la pantalla
        this.setTitle("PIN");
        this.setPreferredSize(new Dimension(500, 500));
        this.setLocationRelativeTo(null); //Sirve para centar la pantalla
        this.getContentPane().setLayout(new BorderLayout());
        //Agrego los paneles al JFrame
        this.getContentPane().add(panelContenedorBotones, BorderLayout.CENTER);
        this.getContentPane().add(panelContenedorPasswrd, BorderLayout.SOUTH);
        this.setResizable(false);

    }

    public void crearControles() {

        // Primero creo el ArrayList de numeros
        ArrayList<Integer> numeros = new ArrayList<>();
        //Recorro el bucle 10 veces para poner un valor a los botones 
        for (int i = 0; i < 10; i++) {
            numeros.add(i);
        }

        Collections.shuffle(numeros); //Lo desordeno

        for (int i = 0; i < 10; i++) {
            int num = +numeros.get(i);
            button = new JButton("" + num); // Añado al boton creado lo uqe hay ahora en i
            panelContenedorBotones.add(button);
            button.addActionListener(new ActionListener() {

                @Override
                public void actionPerformed(ActionEvent e) {
                    String c;
                    if (jPasswordField.getText().equals("")) {
                        c = String.valueOf(num);
                        ver = false;
                    } else {
                        c = jPasswordField.getText() + String.valueOf(num);
                    }
                    jPasswordField.setText(c);
                    ver = true;
                }
            });
        }

        button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

            }
        });
        jPasswordField = new JPasswordField();
        jPasswordField.setPreferredSize(new Dimension(400, 20));
        jPasswordField.setEditable(false);
        panelContenedorPasswrd.add(jPasswordField);

        JButton botonOjo = new JButton("O");

        botonOjo.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (ver) {
                    jPasswordField.setEchoChar('*');
                    botonOjo.setText("O");
                    ver = false;
                } else {
                    jPasswordField.setEchoChar((char) 0);
                    botonOjo.setText(/*"H:\\Grado-Superior-DAM\\Programación\\3º Evaluación\\Tema9_Programacion_GUI\\src\\main\\java\\Ejercicio_1\\MostrarPswrd.png"*/"O");//
                    //Mostrar la imagen del ojo
                    ver = true;
                }
            }
        });

        panelContenedorBotones.add(botonOjo);

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
            .addGap(0, 89, Short.MAX_VALUE)
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
            java.util.logging.Logger.getLogger(Ejercicio_1_PIN.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Ejercicio_1_PIN.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Ejercicio_1_PIN.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Ejercicio_1_PIN.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Ejercicio_1_PIN().setVisible(true);
            }
        });
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables
}
