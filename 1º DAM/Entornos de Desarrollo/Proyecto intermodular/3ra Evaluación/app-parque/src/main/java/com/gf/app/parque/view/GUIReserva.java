/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package com.gf.app.parque.view;

import com.gf.app.parque.entities.Menu;
import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.FlowLayout;
import static java.awt.Frame.MAXIMIZED_BOTH;
import java.awt.GridLayout;
import java.awt.Toolkit;
import java.util.Properties;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import org.jdatepicker.impl.DateComponentFormatter;
import org.jdatepicker.impl.JDatePanelImpl;
import org.jdatepicker.impl.JDatePickerImpl;
import org.jdatepicker.impl.UtilDateModel;

/**
 * GUIReserva: una ventana donde meter los datos para reservar. Aparecen los
 * distintos inputs correspondientes a cada atributo del elemento de la base de
 * datos.
 *
 * @author priparno
 */
public class GUIReserva extends javax.swing.JFrame {

    /**
     * tamPantalla: el tamanio de la pantalla.
     */
    private Dimension tamPantalla = Toolkit.getDefaultToolkit().getScreenSize();

    /**
     * panelOpciones: el panel con los campos a rellenar.
     */
    private JPanel panelOpciones;
    /**
     * panelBotones: el panel donde iran los botones de aceptar y cancelar.
     */
    private JPanel panelBotones;
    /**
     * panelCentrar: el panel para centrar los elementos.
     */
    private JPanel panelCentrar;

    /**
     * textosCampos: un array de cadenas con los nombres de los campos.
     */
    private final String[] textosCampos = {"Nombre: ", "Fecha: ", "Numero de participantes: ", "Menu: ", "Sala: ", "Es cumple: "};

    /**
     * nombreEvento: una caja de texto donde introducir el nombre del evento.
     */
    private JTextField nombreEvento;
    /**
     * modelo: un modelo para escoger la fecha.
     */
    UtilDateModel modelo = new UtilDateModel();
    /**
     * panelDate: el panel que muestra la fecha.
     */
    private JDatePanelImpl panelDate = new JDatePanelImpl(modelo, new Properties());
    /**
     * panelPicker: el componente que permite escoger la fecha.
     */
    private JDatePickerImpl panelPicker = new JDatePickerImpl(panelDate, new DateComponentFormatter());
    /**
     * numeroParticipantes: una caja de texto donde introducir el numero de
     * participantes.
     */
    private JTextField numeroParticipantes;
    /**
     * opcionesMenu: un desplegable con las opciones de menu.
     */
    private JComboBox<Menu> opcionesMenu = new JComboBox<>();
    /**
     * opcionesSala: un desplegable con las opciones de la sala.
     */
    private JComboBox<String> opcionesSala = new JComboBox<>();
    /**
     * checkIsCumple: una casilla para marcar si es cumple o no.
     */
    private JCheckBox checkIsCumple;

    /**
     * cancelarBut: es el boton de cancelar.
     */
    private JButton cancelarBut;
    /**
     * aceptarBut: es el boton de aceptar.
     */
    private JButton aceptarBut;

    /**
     * Creates new form GUIReserva
     */
    public GUIReserva() {
        initComponents();
        setFrame();
    }

    /**
     * setFrame: es el metodo principal que ajusta y coloca componentes por
     * pantalla
     */
    private void setFrame() {
        this.setTitle("Reservar");
        this.setSize(tamPantalla);
        this.setExtendedState(MAXIMIZED_BOTH);
        this.getContentPane().setLayout(new GridLayout(2, 1));
        setTextFields();
        setButtons();
    }

    /**
     * setTextFields: coloca los campos a rellenar por pantalla.
     */
    private void setTextFields() {
        panelOpciones = new JPanel(new BorderLayout());
        panelCentrar = new JPanel(new GridLayout(6, 0));
        setTFNombreField();
        setPickerFechaField();
        setTFNumeroParticipantes();
        setComboOpcionMenu();
        setComboNumeroSala();
        setRadioIsCumple();
        panelOpciones.add(panelCentrar, BorderLayout.SOUTH);
        this.getContentPane().add(panelOpciones);
    }

    /**
     * setTNombreField: coloca la caja de texto para el nombre del evento.
     */
    private void setTFNombreField() {
        nombreEvento = new JTextField();
        nombreEvento.setPreferredSize(new Dimension(200, 30));
        JPanel panelExtra = new JPanel(new GridLayout(0, 2));
        JLabel texto = new JLabel(textosCampos[0]);
        texto.setHorizontalAlignment(SwingConstants.RIGHT);
        JPanel panelTF = new JPanel(new FlowLayout(FlowLayout.LEFT));
        panelExtra.add(texto);
        panelTF.add(nombreEvento);
        panelExtra.add(panelTF);
        panelCentrar.add(panelExtra);
    }

    /**
     * setPickerFechaField: coloca el componente para escoger la fecha.
     */
    private void setPickerFechaField() {
        JPanel panelExtra = new JPanel(new GridLayout(0, 2));
        JLabel texto = new JLabel(textosCampos[1]);
        texto.setHorizontalAlignment(SwingConstants.RIGHT);
        JPanel panelTF = new JPanel(new FlowLayout(FlowLayout.LEFT));
        panelExtra.add(texto);
        panelTF.add(panelPicker);
        panelExtra.add(panelTF);
        panelCentrar.add(panelExtra);
    }

    /**
     * setTFNumeroParticipantes: coloca la caja de texto para escoger el numero
     * de participantes.
     */
    private void setTFNumeroParticipantes() {
        numeroParticipantes = new JTextField();
        numeroParticipantes.setPreferredSize(new Dimension(200, 30));
        JPanel panelExtra = new JPanel(new GridLayout(0, 2));
        JLabel texto = new JLabel(textosCampos[2]);
        texto.setHorizontalAlignment(SwingConstants.RIGHT);
        JPanel panelTF = new JPanel(new FlowLayout(FlowLayout.LEFT));
        panelExtra.add(texto);
        panelTF.add(numeroParticipantes);
        panelExtra.add(panelTF);
        panelCentrar.add(panelExtra);
    }

    /**
     * setComboOpcionMenu; coloca el desplegable para escoger el menu.
     */
    private void setComboOpcionMenu() {
        JPanel panelExtra = new JPanel(new GridLayout(0, 2));
        JLabel texto = new JLabel(textosCampos[3]);
        texto.setHorizontalAlignment(SwingConstants.RIGHT);
        JPanel panelTF = new JPanel(new FlowLayout(FlowLayout.LEFT));
        panelExtra.add(texto);
        panelTF.add(opcionesMenu);
        panelExtra.add(panelTF);
        panelCentrar.add(panelExtra);
    }

    /**
     * setComboNumeroSala: coloca el desplegable para escoger la sala.
     */
    private void setComboNumeroSala() {
        JPanel panelExtra = new JPanel(new GridLayout(0, 2));
        JLabel texto = new JLabel(textosCampos[4]);
        texto.setHorizontalAlignment(SwingConstants.RIGHT);
        JPanel panelTF = new JPanel(new FlowLayout(FlowLayout.LEFT));
        panelExtra.add(texto);
        panelTF.add(opcionesSala);
        panelExtra.add(panelTF);
        panelCentrar.add(panelExtra);
    }

    /**
     * setRadioIsCumple: coloca la casilla para marcar en el caso de que sea
     * cumple.
     */
    private void setRadioIsCumple() {
        checkIsCumple = new JCheckBox();
        JPanel panelExtra = new JPanel(new GridLayout(0, 2));
        JLabel texto = new JLabel(textosCampos[5]);
        texto.setHorizontalAlignment(SwingConstants.RIGHT);
        JPanel panelTF = new JPanel(new FlowLayout(FlowLayout.LEFT));
        panelExtra.add(texto);
        panelTF.add(checkIsCumple);
        panelExtra.add(panelTF);
        panelCentrar.add(panelExtra);
    }

    /**
     * setButtons: coloca y crea los botones en la ventana.
     */
    private void setButtons() {
        cancelarBut = new JButton("Cancelar");
        aceptarBut = new JButton("Aceptar");
        panelBotones = new JPanel(new FlowLayout(FlowLayout.CENTER, 50, 50));
        this.getContentPane().add(panelBotones);
        panelBotones.add(aceptarBut);
        panelBotones.add(cancelarBut);
    }

    /**
     * getNombreEvento: devuelve un JTextField donde se introducira el nombre
     * del evento.
     *
     * @see JTextField
     *
     * @return un JTextField
     */
    public JTextField getNombreEvento() {
        return nombreEvento;
    }

    /**
     * getModelo: devuelve el modelo que utiliza JDatePicker para seleccionar la
     * fecha.
     *
     * @see UtilDateModel
     * @see JDatePanelImpl
     * @see JDatePickerImpl
     *
     * @return un UtilDateModel
     */
    public UtilDateModel getModelo() {
        return modelo;
    }

    /**
     * getOpcionesMenu: devuelve un JComboBox de String que muestra los menus
     * disponibles.
     *
     * @see JComboBox
     *
     * @return un JComboBox
     */
    public JComboBox<Menu> getOpcionesMenu() {
        return opcionesMenu;
    }

    /**
     * getNumeroParticipantes: devuelve un JTextField donde se introducira el
     * numero de participantes.
     *
     * @see JTextField
     *
     * @return un JTextField
     */
    public JTextField getNumeroParticipantes() {
        return numeroParticipantes;
    }

    /**
     * getOpcionesSala: devuelve un JComboBox de String con las salas
     * disponibles.
     *
     * @see JComboBox
     *
     * @return un JComboBox
     */
    public JComboBox<String> getOpcionesSala() {
        return opcionesSala;
    }

    /**
     * getCheckIsCumple: devuelve un JCheckBox que marca si el evento es cumple
     * o no. Si esta marcado es cumple y si no esta marcado no lo es.
     *
     * @see JCheckBox
     *
     * @return un JCheckBox
     */
    public JCheckBox getCheckIsCumple() {
        return checkIsCumple;
    }

    /**
     * getCancelarBut: devuelve un JButton que sera el boton de cancelar.
     *
     * @see JButton
     *
     * @return un JButton
     */
    public JButton getCancelarBut() {
        return cancelarBut;
    }

    /**
     * getAceptarBut: devuelve un JButton que sera el boton de aceptar.
     *
     * @see JButton
     *
     * @return un JButton
     */
    public JButton getAceptarBut() {
        return aceptarBut;
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

    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables
}
