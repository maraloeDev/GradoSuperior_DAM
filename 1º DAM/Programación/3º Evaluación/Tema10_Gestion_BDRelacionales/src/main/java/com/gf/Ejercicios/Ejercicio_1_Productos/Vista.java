package com.gf.Ejercicios.Ejercicio_1_Productos;

import java.awt.event.ItemEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.DefaultComboBoxModel;
import javax.swing.DefaultListModel;
import javax.swing.JOptionPane;

public class Vista extends javax.swing.JFrame {

    private String url = "jdbc:mysql://localhost:3306/almacen";
    private String user = "root";
    private String passwd = "";
    private DefaultListModel modeloLista = new DefaultListModel();

    public Vista() {
        initComponents();
        this.setLocationRelativeTo(null);
        this.jList1.setModel(modeloLista);
        cargarTipos();
    }

    public Connection conectarBD() throws SQLException {
        return DriverManager.getConnection(url, user, passwd);
    }

    private void cargarTipos() {
        try (Connection con = conectarBD()) {
            DefaultComboBoxModel modeloCombo = new DefaultComboBoxModel();
            this.jComboBox1.setModel(modeloCombo);
            modeloCombo.addElement("(elige uno)");

            Statement st = con.createStatement();
            ResultSet r = st.executeQuery("SELECT * FROM tiposproducto");
            while (r.next()) {
                modeloCombo.addElement(new TipoProducto(r.getInt("idTipo"), r.getString("tipo")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jComboBox1 = new javax.swing.JComboBox();
        jPanel2 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jList1 = new javax.swing.JList();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Almacén");

        jLabel1.setText("Tipo producto:");

        jComboBox1.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jComboBox1ItemStateChanged(evt);
            }
        });
        jComboBox1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox1ActionPerformed(evt);
            }
        });

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder("Listado de productos"));

        jList1.setSelectionMode(javax.swing.ListSelectionModel.SINGLE_SELECTION);
        jList1.addListSelectionListener(new javax.swing.event.ListSelectionListener() {
            public void valueChanged(javax.swing.event.ListSelectionEvent evt) {
                jList1ValueChanged(evt);
            }
        });
        jScrollPane1.setViewportView(jList1);

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 424, Short.MAX_VALUE)
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 202, Short.MAX_VALUE)
                .addContainerGap())
        );

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(122, 122, 122)
                        .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 101, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, 132, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1))
                .addGap(18, 18, 18)
                .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    //SELECCIÓN DE UN ELEMENTO DEL COMBO
    private void jComboBox1ItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jComboBox1ItemStateChanged
        if (evt.getStateChange() == ItemEvent.SELECTED && this.jComboBox1.getSelectedIndex() != 0) { //si se ha elegido un tipo de producto
            //cargamos en la lista los productos del tipo elegido
            //para ello consultamos en la BD los productos de ese tipo
            TipoProducto tipo = (TipoProducto) this.jComboBox1.getSelectedItem();
            ArrayList<Producto> listaProductos = buscarProductos(tipo);
            for (Producto producto : listaProductos) {
                modeloLista.addElement(producto);
            }
        } else {
            modeloLista.clear();
        }
    }//GEN-LAST:event_jComboBox1ItemStateChanged

    //SE SELECCIONA UN ELEMENTO DE LA LISTA
    private void jList1ValueChanged(javax.swing.event.ListSelectionEvent evt) {//GEN-FIRST:event_jList1ValueChanged
        if (this.jList1.getSelectedValue() != null) {  //si se ha elegido un elemento
            Producto p = (Producto) this.jList1.getSelectedValue(); //Producto seleccionado
            int cantidad = p.getCantidad();
            if (cantidad >= 10) {
                JOptionPane.showMessageDialog(this, "Nº de unidades: " + cantidad, "Stock en almacén", JOptionPane.INFORMATION_MESSAGE);
            } else {
                JOptionPane.showMessageDialog(this, "Nº de unidades: " + cantidad + "\nDebajo del stock de seguridad", "Stock en almacén", JOptionPane.WARNING_MESSAGE);
            }
        }
    }//GEN-LAST:event_jList1ValueChanged

    private void jComboBox1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jComboBox1ActionPerformed

    //Método que devuelve un arrayList con los productos
    //del tipo recibido como parámetro
    public ArrayList<Producto> buscarProductos(TipoProducto tipo) {
        ArrayList l = null;
        try (Connection con = conectarBD()) {
            //buscamos los productos 
            l = new ArrayList();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM productos WHERE tipo=?");
            ps.setInt(1, tipo.getIdTipo());
            ResultSet r = ps.executeQuery();
            while (r.next()) {
                int codigo = r.getInt("idProducto");
                String tip = r.getString("tipo");
                String desc = r.getString("descripcion");
                double precio = r.getDouble("precio");
                int cantidad = r.getInt("cantidad");
                Producto p = new Producto(codigo, tip, desc, precio, cantidad);
                l.add(p);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return l;
    }

    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {

            public void run() {
                new Vista().setVisible(true);
            }
        });
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JComboBox jComboBox1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JList jList1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    // End of variables declaration//GEN-END:variables
}
