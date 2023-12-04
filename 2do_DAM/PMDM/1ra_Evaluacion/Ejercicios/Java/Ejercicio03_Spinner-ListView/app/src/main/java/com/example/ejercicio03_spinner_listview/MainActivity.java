package com.example.ejercicio03_spinner_listview;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ListView;

import com.example.ejercicio03_spinner_listview.databinding.ActivityMainBinding;
import com.google.android.material.snackbar.Snackbar;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    private ActivityMainBinding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.activity_main);

        // Utilizo el ViewBilding para acceder mas rapido a los objetos
        binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        // Recojo los datos de los objs
        EditText datos = binding.etDatos;
        ListView lista = binding.lvDatos;

        //Creo un ArrayList con los items que voy a añadir
        ArrayList<String> items = new ArrayList<>();


        ArrayAdapter<String> stringArrayAdapter = new ArrayAdapter<>(getApplicationContext(), android.R.layout.simple_list_item_1, items);
        lista.setAdapter(stringArrayAdapter);

        // Cuando se le de click al boton se añadira el dato introducido por teclado, y
        // luego se notifica al adaptador que los datos han cambiado
        binding.bAniadir.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                items.add(datos.getText().toString());
                stringArrayAdapter.notifyDataSetChanged();
            }
        });
    }
}