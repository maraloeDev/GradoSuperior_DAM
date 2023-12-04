package com.example.ejercicio01_componentesbasicos;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.google.android.material.snackbar.Snackbar;

public class MainActivity extends AppCompatActivity {

    private TextView bResultado;
    private String operador = "";
    private double num1 = 0;
    private double num2 = 0;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        bResultado = findViewById(R.id.tvResults);
        ((Button) findViewById(R.id.bClear)).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                ((TextView) findViewById(R.id.tvResults)).setText(" ");
            }
        });
// Si se le da click, a cualquier operacion, hara la operacion correspondiente
        View.OnClickListener numberOperatorClickListener = new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Button button = (Button) view;
                String buttonText = button.getText().toString();
                if (isNumeric(buttonText)) {
                    bResultado.append(buttonText);
                } else if (buttonText.equals("+")) {
                    operador = "+";
                    num1 = Double.parseDouble(bResultado.getText().toString());
                    bResultado.setText("");
                } else if (buttonText.equals("-")) {
                    operador = "-";
                    num1 = Double.parseDouble(bResultado.getText().toString());
                    bResultado.setText("");
                } else if (buttonText.equals("=")) {
                    if (!operador.isEmpty()) {
                        num2 = Double.parseDouble(bResultado.getText().toString());
                        double resultado = 0;
                        if (operador.equals("+")) {
                            resultado = num1 + num2;
                        } else if (operador.equals("-")) {
                            resultado = num1 - num2;
                        }
                        bResultado.setText(String.valueOf(resultado));
                        operador = "";
                        num1 = resultado;
                    }
                }
            }
        };

        // Creo un Array de numeros, con todos los numeros

        int[] numberButtonIds = {
                R.id.b1, R.id.b2, R.id.b3,
                R.id.b4, R.id.b5, R.id.b6,
                R.id.b7, R.id.b8, R.id.b9};
        // Creo un Array de numeros, con todas las " Operaciones"

        int[] operatorButtonIds = {
                R.id.bSume, R.id.bResta, R.id.bEqual};

        for (int id : numberButtonIds) {
            findViewById(id).setOnClickListener(numberOperatorClickListener);
        }

        for (int id : operatorButtonIds) {
            findViewById(id).setOnClickListener(numberOperatorClickListener);
        }
    }

    private boolean isNumeric(String str) {
        try {
            Double.parseDouble(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}
