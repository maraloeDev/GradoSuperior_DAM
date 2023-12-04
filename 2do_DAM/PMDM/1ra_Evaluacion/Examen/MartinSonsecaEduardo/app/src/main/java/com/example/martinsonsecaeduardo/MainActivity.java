package com.example.martinsonsecaeduardo;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Spinner;

import com.example.martinsonsecaeduardo.databinding.ActivityMainBinding;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        return super.onOptionsItemSelected(item);
    }

    

    private ActivityMainBinding binding;
    ArrayList<String> datosMostrar = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // setContentView(R.layout.activity_main);

        binding = ActivityMainBinding.inflate(getLayoutInflater());

        setContentView(binding.getRoot());
        aniadorDatos();

        Alumno alumno = new Alumno("Eduardo", "5");
        binding.setAlumno(alumno);
    }

    private void aniadorDatos() {

        ListView lvDatos = binding.lvDatos;

        lvDatos.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                ArrayAdapter<String> adapter = new ArrayAdapter<>(getApplicationContext(), android.R.layout.simple_list_item_1, datosMostrar);

                lvDatos.setAdapter(adapter);
                String nombre = binding.etNombre.getText().toString();
                String calificacion = (String) binding.spCalificacion.getSelectedItem();
                Alumno alumno = new Alumno(nombre, calificacion);
                datosMostrar.add(alumno.toString());

                Log.d(getAttributionTag(), "Datos" + "Los datos son " + alumno.toString());


                adapter.notifyDataSetChanged(); //Para que no e vaya "Pisando" el dato
            }
        });
    }
}