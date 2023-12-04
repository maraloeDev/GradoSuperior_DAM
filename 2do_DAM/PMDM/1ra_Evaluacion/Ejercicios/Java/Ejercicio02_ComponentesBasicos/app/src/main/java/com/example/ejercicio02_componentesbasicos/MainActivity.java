package com.example.ejercicio02_componentesbasicos;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.example.ejercicio02_componentesbasicos.databinding.ActivityMainBinding;
import com.google.android.material.snackbar.Snackbar;

import java.util.ArrayList;


public class MainActivity extends AppCompatActivity {

    private ActivityMainBinding bilding;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.activity_main);

        // Esto sirve para poner el como contenido de la vista, el bilding, en la vista
        bilding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(bilding.getRoot());

        // Llamo al metodo spinnerCiudades para que cargue las ciudades
        spinnerCiudades();

        bilding.bGuardar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                recuperarDatos();
                Snackbar.make(v,"Mira el Logcat para comprobar los datos ;)", Snackbar.LENGTH_LONG).show();
            }
        });
    }
 // Creo este metodo creo un spinner, y un adaptador
    private void spinnerCiudades() {
        Spinner spinner = bilding.spinner;
        ArrayAdapter adapter = new ArrayAdapter<String>(getApplicationContext(), android.R.layout.simple_spinner_dropdown_item);
        adapter.add("Salamanca");
        adapter.add("Valladolid");
        adapter.add("Burgos");
        spinner.setAdapter(adapter);
    }

    // Recuperación de todos los datos de los objs
    private void recuperarDatos() {
        String nombre = bilding.ptNombre.getText().toString();
        String estado = ((RadioButton)findViewById(bilding.rgCS.getCheckedRadioButtonId())).getText().toString();
        String ciudad = bilding.spinner.getSelectedItem().toString();
        ArrayList<String> deportes = new ArrayList<>();

        for (int i = 0; i < bilding.checkboxGroup.getChildCount(); i++) {
            CheckBox cajaDepotes = (CheckBox) bilding.checkboxGroup.getChildAt(i);
            if (cajaDepotes.isChecked()){
                deportes.add(cajaDepotes.getText().toString());
            }
        }

        Usuario usuario = new Usuario(nombre, estado, ciudad, deportes);
        Log.d("Depurando", usuario.toString());
    }

}