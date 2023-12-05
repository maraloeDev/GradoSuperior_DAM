package com.example.ejercicio015_activitys

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.ejercicio015_activitys.databinding.ActivityPartidosPoliticosBinding

class ActivityPartidosPoliticos : AppCompatActivity() {

    lateinit var binding: ActivityPartidosPoliticosBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        //setContentView(R.layout.activity_partidos_politicos)

        binding = ActivityPartidosPoliticosBinding.inflate(layoutInflater)
        setContentView(binding.root)
    }
}