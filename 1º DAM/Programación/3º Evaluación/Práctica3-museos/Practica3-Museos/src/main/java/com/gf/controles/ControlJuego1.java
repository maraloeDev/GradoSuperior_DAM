/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gf.controles;

import com.gf.dao.Dao;
import javax.swing.JPanel;
import java.awt.GridLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
/**
 *
 * @author Eduardo Martín-Sonseca y Mario Ortuñez
 */

public class ControlJuego1 {

    private final Dao dao = new Dao();

    private final String[] nombres = {"Nombre 1", "Nombre 2", "Nombre 3", "Nombre 4"};
    private final String[] imagenes = {"imagen1.png", "imagen2.png", "imagen3.png", "imagen4.png"};

    private JPanel panelCuadros;
    private JLabel labelNombreArrastrado;
    private JLabel cuadroSeleccionado;

    public JPanel rellenarPanelCuadros() {
        panelCuadros = new JPanel(new GridLayout(2, 2));

        for (int i = 0; i < nombres.length; i++) {
            JLabel cuadro = new JLabel();
            cuadro.setIcon(new ImageIcon(getClass().getResource(imagenes[i])));
            cuadro.setName(nombres[i]);
            cuadro.setBorder(BorderFactory.createLineBorder(Color.BLACK, 2));
            cuadro.setHorizontalAlignment(JLabel.CENTER);
            cuadro.setVerticalAlignment(JLabel.CENTER);
            cuadro.setFont(new Font("Arial", Font.BOLD, 20));

            cuadro.addMouseListener(new MouseAdapter() {
                public void mousePressed(MouseEvent event) {
                    cuadroSeleccionado = (JLabel) event.getSource();
                }

                public void mouseReleased(MouseEvent event) {
                    if (labelNombreArrastrado != null && cuadroSeleccionado != null) {
                        String nombreArrastrado = labelNombreArrastrado.getText();
                        String nombreCuadro = cuadroSeleccionado.getName();

                        if (nombreArrastrado.equals(nombreCuadro)) {
                            cuadroSeleccionado.setBorder(BorderFactory.createLineBorder(Color.GREEN, 2));
                        } else {
                            cuadroSeleccionado.setBorder(BorderFactory.createLineBorder(Color.RED, 2));
                        }
                    }
                }
            });

            panelCuadros.add(cuadro);
        }

        return panelCuadros;
    }

    public JPanel rellenarPanelDatos() {
        JPanel panelDatos = new JPanel(new GridLayout(0, 2));

        for (String nombre : nombres) {
            JLabel labelNombre = new JLabel(nombre);
            labelNombre.setBorder(BorderFactory.createLineBorder(Color.BLACK, 2));
            labelNombre.setHorizontalAlignment(JLabel.CENTER);
            labelNombre.setVerticalAlignment(JLabel.CENTER);
            labelNombre.setFont(new Font("Arial", Font.BOLD, 20));

            labelNombre.addMouseListener(new MouseAdapter() {
                public void mousePressed(MouseEvent event) {
                    labelNombreArrastrado = (JLabel) event.getSource();
                }

                public void mouseReleased(MouseEvent event) {
                    labelNombreArrastrado = null;
                }
            });

            panelDatos.add(labelNombre);
        }

        return panelDatos;
    }

    public JPanel rellenarPanelBoton() {
        JPanel panelBoton = new JPanel();

        // Aquí puedes añadir los componentes necesarios para el panel del botón

        return panelBoton;
    }

    public JPanel rellenarPanelContador() {
        JPanel panelContador = new JPanel();

        // Aquí puedes añadir los componentes necesarios para el panel del contador

        return panelContador;
    }
}
