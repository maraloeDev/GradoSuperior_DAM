package com.example.ejemplo020_comunicacionentrefragments

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.ejemplo020_comunicacionentrefragments.databinding.FragmentSuperiorBinding

class MainActivity : AppCompatActivity() {

    lateinit var fragmentSuperior: FragmentSuperiorBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }
}