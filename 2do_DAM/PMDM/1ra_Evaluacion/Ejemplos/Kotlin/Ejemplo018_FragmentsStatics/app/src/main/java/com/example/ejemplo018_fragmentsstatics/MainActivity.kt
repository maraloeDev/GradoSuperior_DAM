package com.example.ejemplo018_fragmentsstatics

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.ejemplo018_fragmentsstatics.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity(),BlankFragment.EscuchadordeFragmentEstatico {

    lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        //setContentView(R.layout.activity_main)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
    }

    override fun onFragmentInteraction() {

        binding.tvContador.text = (binding.tvContador.text.toString().toInt() + 1).toString()
    }
}