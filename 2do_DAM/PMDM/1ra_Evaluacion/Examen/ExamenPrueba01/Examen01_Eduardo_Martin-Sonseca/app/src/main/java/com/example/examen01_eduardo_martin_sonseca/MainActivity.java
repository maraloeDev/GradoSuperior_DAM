package com.example.examen01_eduardo_martin_sonseca;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.Toast;
import android.widget.ToggleButton;

import com.example.examen01_eduardo_martin_sonseca.databinding.ActivityMainBinding;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    private ActivityMainBinding binding;
    private ArrayList<String> almacenaDatos = new ArrayList<>();


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // setContentView(R.layout.activity_main);

        binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        String nombre = binding.etNombre.getText().toString();
        String edad = binding.etEdad.getText().toString();
        String ciudades = (String) binding.spCiudades.getSelectedItem();
        ToggleButton activarDesactivar = binding.tbOnOff;
        Button bGrabar = binding.bGrabar;
        ListView lvDatos = binding.lvDatos;

        activarDesactivar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (activarDesactivar.getText().equals("OFF")){
                    activarDesactivar.setText("ON");
                    bGrabar.setEnabled(true);
                } else{
                    activarDesactivar.setText("OFF");
                    bGrabar.setEnabled(false);
                }
            }
        });

        bGrabar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String nombre = binding.etNombre.getText().toString();
                String edad = binding.etEdad.getText().toString();
                String ciudades = (String) binding.spCiudades.getSelectedItem();

                Persona persona = new Persona(nombre,edad,ciudades);



                // Actualizar el ListView
                ArrayAdapter<String> adaptado = new ArrayAdapter<>(getApplicationContext(), android.R.layout.simple_list_item_1, almacenaDatos);
                lvDatos.setAdapter(adaptado);
                almacenaDatos.add(persona.toString());
                adaptado.notifyDataSetChanged();
            }
        });

        lvDatos.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                Persona persona = new Persona(nombre,edad,ciudades);
                Toast.makeText(getApplicationContext(), "Los datos son " + persona.toString(), Toast.LENGTH_LONG).show();

            }
        });
    }


    }

