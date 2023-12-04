package com.example.examen02_eduardomartin_sonseca;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Toast;
import android.widget.ToggleButton;
import com.example.examen02_eduardomartin_sonseca.databinding.ActivityMainBinding;
import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    private ActivityMainBinding binding;
    private Persona persona;
    private Button anadirUsuario;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        anadirUsuario = binding.bAnadir;

        comprobaciones();
        anadirName();
        mostrarDatosNS();
        lvDatos.setAdapter(adaptado);
    }

    ArrayList<String> datos = new ArrayList<>();
    ArrayAdapter<String> adaptado = new ArrayAdapter<String>(MainActivity.this, android.R.layout.simple_list_item_1);
    ListView lvDatos = binding.lvDatos;

    void comprobaciones() {
        ToggleButton botonCambio = binding.tbOnOff;
        botonCambio.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (botonCambio.getText().equals("OFF")) {
                    botonCambio.setText("ON");
                    anadirUsuario.setEnabled(true);
                } else if (botonCambio.getText().equals("ON")) {
                    botonCambio.setText("OFF");
                    anadirUsuario.setEnabled(false);
                }
            }
        });
    }

    void anadirName() {
        anadirUsuario.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String nombre = binding.etNombre.getText().toString();
                int buttonsSex = binding.rgSexo.getCheckedRadioButtonId();
                persona = new Persona(nombre, buttonsSex);

                datos.add(persona.getNombre());
                adaptado.notifyDataSetChanged();
            }
        });
    }

    void mostrarDatosNS() {
        lvDatos.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Toast.makeText(getApplicationContext(), "Los datos introducidos son " + persona.toString(), Toast.LENGTH_LONG).show();
            }
        });
    }
}
