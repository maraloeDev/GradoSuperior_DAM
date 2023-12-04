/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gf.app.parque.resources;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Validaciones: clase que realiza distintas validaciones para campos de la
 * aplicacion.
 *
 * @author priparno
 */
public class Validaciones {

    /**
     * LETRAS_DNI: la cadena con la que se saca la letra del dni.
     */
    private static final String LETRAS_DNI = "TRWAGMYFPDXBNJZSQVHLCKE";

    /**
     * validateDni: para que un dni sea valido tiene que tener 8 numeros, 1
     * letra mayuscula y que cumpla el modulo 23.
     *
     * @param dni una cadena que representa el dni a validar
     * @return true -> es correcto, false -> no es correcto
     */
    public static boolean validateDni(String dni) {
        Pattern pat = Pattern.compile("[0-9]{8}[A-Z]");
        Matcher mat = pat.matcher(dni);
        if (mat.matches()) {
            return modulo23(dni);
        }
        return false;
    }

    /**
     * modulo23: realiza el modulo 23 y comprueba que la letra se ajusta al
     * algoritmo.
     *
     * @param dni una cadena que representa el dni a validar
     * @return true -> es correcto, false -> no es correcto
     */
    private static boolean modulo23(String dni) {
        int num = Integer.parseInt(dni.substring(0, dni.length() - 1));
        char letra = dni.substring(dni.length() - 1).charAt(0);
        int resto = num % 23;
        return LETRAS_DNI.charAt(resto) == letra;
    }

    /**
     * validateName: para que un nombre sea valido tiene que tener caracteres y
     * que esos sean letras.
     *
     * @param nombre una cadena que representa el nombre a validar
     * @return true -> es correcto, false -> no es correcto
     */
    public static boolean validateName(String nombre) {
        if (nombre.isEmpty() || nombre.isBlank()) {
            return false;
        }
        nombre = nombre.toUpperCase();
        for (int i = 0; i < nombre.length(); i++) {
            if (!Character.isAlphabetic(nombre.charAt(i)) && nombre.charAt(i) != 'Ñ' && nombre.charAt(i) != ' ') {
                return false;
            }
        }
        return true;
    }
}
