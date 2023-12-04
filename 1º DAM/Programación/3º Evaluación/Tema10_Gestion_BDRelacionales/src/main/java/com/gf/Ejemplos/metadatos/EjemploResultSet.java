package com.gf.Ejemplos.metadatos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author macarena

 * NOTA: Observa como la conexión permanece abierta mientras se trabaja con la BD 
 *
 */
public class EjemploResultSet {

    private ResultSet resulSet;
    private Connection con;

    public static void main(String[] args) {
        EjemploResultSet ej = new EjemploResultSet();

        //opciones a mostrar en el JOptionPane
        Object[] operaciones = {"Recuperar personas", "Insertar persona", "Modificar edad", "Eliminar persona"};

        //cargamos el ResultSet
        ej.abrirConexion();
        ej.recuperarDatos();

        Object operacion = JOptionPane.showInputDialog(null, "Operación a realizar: ", "Ejemplo uso ResultSet", JOptionPane.PLAIN_MESSAGE, null, operaciones, operaciones[0]);

        while (operacion != null) { //mientras no pulse el boton Cancelar
            switch (String.valueOf(operacion)) {
                case "Recuperar personas" ->
                    ej.mostrarPersonas();
                case "Insertar persona" ->
                    ej.insertarPersona();
                case "Modificar edad" ->
                    ej.modificarEdad();
                case "Eliminar persona" ->
                    ej.eliminarPersona();
            }
            operacion = String.valueOf(JOptionPane.showInputDialog(null, "Operación a realizar: ", "Ejemplo uso ResultSet", JOptionPane.PLAIN_MESSAGE, null, operaciones, operaciones[0]));
        }

        ej.cerrarConexion(); 

    }

    //Creamos el ResultSet actualizable y desplazable.
    private void recuperarDatos() {
        try {
            
            Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            resulSet = st.executeQuery("SELECT * FROM personas");
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    //Muestra todos los datos de las personas
    private void mostrarPersonas() {
        try {
            resulSet.first();
            do {
                System.out.println(resulSet.getInt(1) + " - " + resulSet.getString(2) + " - " + resulSet.getString(3)
                        + " : " + resulSet.getInt(4));
            } while (resulSet.next());
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

    }

    //Modifica la edasd de una persona buscándole por ID
    public void modificarEdad() {
        int id = Integer.parseInt(JOptionPane.showInputDialog("ID: "));
        int edad = Integer.parseInt(JOptionPane.showInputDialog("Nueva edad: "));
        modificarEdad(id, edad);
    }

    private void modificarEdad(int pk, int edad) {
        int pos = buscarPersona(pk);
        if (pos > -1) {
            System.out.println("Posicion: " + pos);
            try {
                resulSet.absolute(pos);
                resulSet.updateInt(4, edad);
                resulSet.updateRow();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        } else {
            System.out.println("Persona inexistente");
        }
    }

    //Busca en el ResultSet una persona por ID
    private int buscarPersona(int pk) {
        try {
            resulSet.first();
            boolean encontrado = false;
            do {
                if (resulSet.getInt(1) == pk) {
                    return resulSet.getRow();
                }
            } while (resulSet.next() && !encontrado);

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return -1;
    }

    //Inserta una fila nueva en el ResultSet correspondiente a una persona
    private void insertarPersona() {
        try {
            resulSet.moveToInsertRow();
            resulSet.updateString(2, "Nueva persona");
            resulSet.updateString(3, "Nueva persona");
            resulSet.updateInt(4, 40);
            resulSet.insertRow();
            resulSet.moveToCurrentRow(); //Sirve para validar la operación 
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

    }

    //Elimina una persona buscándole por ID
    public void eliminarPersona() {
        int id = Integer.parseInt(JOptionPane.showInputDialog("ID: "));
        eliminarPersona(id);
    }

    private void eliminarPersona(int pk) {
        int pos = buscarPersona(pk);
        if (pos > -1) {
            System.out.println("Posicion: " + pos);
            try {
                resulSet.absolute(pos);
                resulSet.deleteRow();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        } else {
            System.out.println("Persona inexisente");
        }
    }

    private void abrirConexion() {
        try {            
            String url = "jdbc:mysql://localhost:3306/prueba";
            con = DriverManager.getConnection(url, "root", "");
            System.out.println("Conexion realizada");
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            System.out.println("Conexion no realizada");
        }
    }

    private void cerrarConexion() {
        try {
            con.close();
            System.out.println("La conexión ha finalizado");
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
}
