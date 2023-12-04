package com.example.ejem12_kotlin_contraintlayout

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.ejem12_kotlin_contraintlayout.databinding.ActivityMainBinding
import com.google.android.material.snackbar.Snackbar

class MainActivity : AppCompatActivity() {

    lateinit var binding : ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        //setContentView(R.layout.activity_main)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        var pedro:Usuario = Usuario("Pedro")
        binding.usuario = pedro

        binding.bGrabar.setOnClickListener {
            val nombre = binding.tietNombre.text.toString()
            val usuario = Usuario(nombre)
            Snackbar.make(binding.root, "Usuario creado: ${usuario.nombre}",Snackbar.LENGTH_SHORT).show()
        }


    }
}