/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */
package com.gf.app.parque.dao;

import com.gf.app.parque.entities.Administrador;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 * AdministradorDAOTest: clase de testeo de los metodos de la clase de acceso a
 * datos AdministradorDAO.
 *
 * @author priparno
 */
public class AdministradorDAOTest {

    /**
     * dao: clase de acceso a datos.
     */
    private AdministradorDAO dao;

    /**
     * DEFAULT CONSTRUCTOR
     */
    public AdministradorDAOTest() {
    }

    /**
     * setUp: por cada test creo una nueva clase de acceso a datos para evitar
     * problemas.
     */
    @BeforeEach
    public void setUp() {
        dao = new AdministradorDAO();
    }

    /**
     * tearDown: por cada test elimino la clase de acceso a datos para evitar
     * problemas.
     */
    @AfterEach
    public void tearDown() {
        dao = null;
    }

    /**
     * testSelectDNI: testea la funcionalidad de buscar un administrador por
     * identificador (dni) en la base de datos. Se busca un elemento que si
     * existe en la base de datos por lo que debe devolver el elemento en
     * cuestion.
     *
     * @throws java.lang.Exception una excepcion de tipo SQLException que salta
     * si no ha sido conectado a la base de datos o si la sintaxis es
     * incorrecta.
     */
    @Test
    public void testSelectDNI_1() throws Exception {
        System.out.println("Seleccionar el dni.");
        //el identificador a buscar
        String dni = "12427920P";
        //el administrador esperado
        Administrador expResult1 = new Administrador();
        expResult1.setDni_admin(dni);
        expResult1.setNombre_admin("Noel");
        expResult1.setApellidos_admin("Prieto Pardo");
        expResult1.setTelefono_admin("655655655");
        expResult1.setCorreo_admin("noel@gmail.com");
        expResult1.setPuesto_admin("MONITOR");
        expResult1.setPassword_admin("macarrones");
        //el resultado del metodo
        Administrador result = dao.selectDNI(dni);
        assertEquals(expResult1, result);
    }

    /**
     * testSelectDNI_2: testea la funcionalidad de buscar un administrador por
     * identificador (dni) en la base de datos. Se busca un elemento que no
     * existe en la base de datos por lo que debe devolver null.
     *
     * @throws java.lang.Exception una excepcion de tipo SQLException que salta
     * si no ha sido conectado a la base de datos o si la sintaxis es
     * incorrecta.
     */
    @Test
    public void testSelectDNI_2() throws Exception {
        System.out.println("Seleccionar el dni.");
        //ahora busco uno que no exista
        String dni = "11111111A";
        Administrador result = dao.selectDNI(dni);
        //no tiene que devolver nada
        assertNull(result);
    }

    /**
     * testUpdateId_1: testea la funcionalidad de actualizar un elemento de la
     * base de datos pasado por parametro. En este caso es uno que existe por lo
     * que debe devolver 1.
     *
     * @throws java.lang.Exception una excepcion de tipo SQLException que salta
     * si no ha sido conectado a la base de datos o si la sintaxis es
     * incorrecta.
     */
    @Test
    public void testUpdateId_1() throws Exception {
        System.out.println("Actualizar segun un identificador.");
        //valor a actualizar
        Administrador a1 = new Administrador();
        a1.setDni_admin("12427920P");
        a1.setNombre_admin("Noel");
        a1.setApellidos_admin("Prieto Pardo");
        a1.setTelefono_admin("655655655");
        a1.setCorreo_admin("noel@gmail.com");
        a1.setPuesto_admin("MONITOR");
        a1.setPassword_admin("macarrones");
        //el valor esperado (1 si actualiza, 0 si no actualiza)
        int expResult = 1;
        //el resultado del metodo
        int result = dao.updateId(a1);
        assertEquals(expResult, result);
    }

    /**
     * testUpdateId_2: testea la funcionalidad de actualizar un elemento de la
     * base de datos pasado por parametro. En este caso es uno que no existe por
     * lo que debe devolver 0.
     *
     * @throws java.lang.Exception una excepcion de tipo SQLException que salta
     * si no ha sido conectado a la base de datos o si la sintaxis es
     * incorrecta.
     */
    @Test
    public void testUpdateId_2() throws Exception {
        System.out.println("Actualizar segun un identificador.");
        //uno que no exista
        Administrador a2 = new Administrador();
        a2.setDni_admin("11111111A");
        //el valor esperado (1 si actualiza, 0 si no actualiza)
        int expResult = 0;
        //el resultado del metodo
        int result = dao.updateId(a2);
        assertEquals(expResult, result);
    }
}
