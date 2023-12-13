package com.example.ejemplo019_meterdatosafrangment

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.example.ejemplo019_meterdatosafrangment.databinding.ActivityMainBinding
import com.google.android.material.snackbar.Snackbar

class MainActivity : AppCompatActivity() {
    lateinit var binding: ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.bEnviarDato.setOnClickListener {
            var dato = binding.etDato.text.toString()
            Snackbar.make(binding.root, dato, Snackbar.LENGTH_LONG).show()


            val fragment = BlankFragment.newInstance(dato)
            supportFragmentManager.
            beginTransaction().replace(R.id.fragment, fragment).commit()

        }
    }
}