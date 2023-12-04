package com.example.ejercicio06_cafetera;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.Spinner;
import android.widget.TextView;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {


    String azucar = "";
    double recaudado = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        anadirCafes();
        botones();
        servir();
    }

    private void anadirCafes() {
        Spinner tiposCafe = findViewById(R.id.spTipoCafe);
        ArrayList<String> cafes = new ArrayList<>();

        cafes.add("con leche");
        cafes.add("solo");
        cafes.add("con azucar");
        cafes.add("sin azucar");
        cafes.add("descafeinado");

        ArrayAdapter<String> adapter = new ArrayAdapter<>(getApplicationContext(), android.R.layout.simple_list_item_1, cafes);

        tiposCafe.setAdapter(adapter);
    }

    private void botones() {

        Button bonOff = findViewById(R.id.bOnOff);
        Button bServir = findViewById(R.id.bServir);

        bonOff.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (bonOff.getText().equals("OFF")) {
                    bonOff.setText("ON");
                    bServir.setEnabled(true);
                } else {
                    bonOff.setText("OFF");
                    bServir.setEnabled(false);
                }
            }
        });
    }

    private void servir() {


        Button bservir = findViewById(R.id.bServir);
        bservir.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                extra();

            }
        });

    }

    private void extra() {


        CheckBox cbxtra = findViewById(R.id.cbAzucar);
        TextView tvrecaudado = findViewById(R.id.tvRecaudado);
        TextView tvService = findViewById(R.id.tvServido);
        Spinner cafesType = findViewById(R.id.spTipoCafe);

        if (cbxtra.isChecked()) {
            recaudado += 0.5;
            azucar = "con";
        } else {
            azucar = "sin";
        }

        recaudado += 1;
        tvrecaudado.setText("Lleva recaudado " + recaudado + "€");
        tvService.setText("Servido " + cafesType.getSelectedItem().toString() +
                " " +
                azucar + " azucar");
    }
}

