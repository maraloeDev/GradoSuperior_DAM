package com.example.ejemplo023_sharedpreferences

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.ejemplo023_sharedpreferences.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    lateinit var binding: ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // setContentView(R.layout.activity_main)

        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.bGuardar.setOnClickListener {
            val nombre = binding.tietDato.text.toString()

            // Se almacenaran los datos en el fichero datos.xml
            val editor = getSharedPreferences("datos", MODE_PRIVATE)
            var preferencia = editor.edit()


            preferencia.putString("nombre", nombre)
            preferencia.apply()
            preferencia.commit()
        }

        binding.bRecuperar.setOnClickListener {

            val cadena = getSharedPreferences("dato", MODE_PRIVATE).getString("nombre", "No hay datos")
            binding.tvDatoaMostrar.text = cadena
        }
    }
}