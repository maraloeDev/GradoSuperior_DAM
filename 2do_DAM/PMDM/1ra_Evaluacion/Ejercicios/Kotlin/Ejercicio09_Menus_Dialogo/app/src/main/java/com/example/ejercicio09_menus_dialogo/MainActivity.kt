package com.example.ejercicio09_menus_dialogo

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Toast
import androidx.appcompat.app.AlertDialog
import com.example.ejercicio09_menus_dialogo.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    lateinit var binding : ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // setContentView(R.layout.activity_main)

        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        var btnFinalizar = binding.bFinalizar

        btnFinalizar.setOnClickListener(View.OnClickListener {
            var alerta = AlertDialog.Builder(this)
            alerta.setTitle("Confirmación")
            alerta.setMessage("¿Confirma que deseas salir?")
            alerta.setPositiveButton("Si"){dialog, which ->
                Toast.makeText(this, "Has pulsado el boton Ok",Toast.LENGTH_LONG).show()
            }
            alerta.setNegativeButton("No"){dialog, which->
                Toast.makeText(this, "Has pulsado el boton No",Toast.LENGTH_LONG).show()
            }
            alerta.show()
        })
    }


}