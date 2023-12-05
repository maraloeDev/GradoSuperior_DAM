package com.example.ejemplo017_llamando_activitys

import android.content.Intent
import android.net.Uri
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.ejemplo017_llamando_activitys.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    lateinit var binding : ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        //setContentView(R.layout.activity_main)

        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.bEnviarTexto.setOnClickListener {
            intent = Intent(Intent.ACTION_SEND)
            intent.setType("text/plain")
            intent.putExtra(Intent.EXTRA_TEXT, "Hola mundo comparativo")
            startActivity(intent)
        }

        binding.bEnviarTexto2.setOnClickListener {
            intent = Intent().apply {
                action = Intent.ACTION_SEND
                setType("text/plain")
                putExtra(Intent.EXTRA_TEXT, "Hola mundo comparativo")
            }
            startActivity(intent)
        }

        binding.bEnviarEmail.setOnClickListener {
            intent = (Intent().apply {
                action = Intent.ACTION_SEND
                setType("text/plain")
                putExtra(Intent.EXTRA_EMAIL, "martinsonsecaeduarod@gmail.com")
                putExtra(Intent.EXTRA_EMAIL, "martinsonsecaeduarod@gmail1.com")
                putExtra(Intent.EXTRA_EMAIL, "martinsonsecaeduarod@gmail2.com")
                putExtra(Intent.EXTRA_EMAIL, "martinsonsecaeduarod@gmail3.com")
            })
        }

        binding.bllamar.setOnClickListener {
            intent = (Intent().apply {
                action = Intent.ACTION_DIAL
                setData(Uri.parse("tel:601094161"))
            })
        }

        binding.bLanzarWeb.setOnClickListener {
            intent = (Intent().apply {
                action = Intent.ACTION_VIEW
                setData(Uri.parse("https://www.google.com"))
                startActivity(this)
            })
        }

        binding.bGoogleMaps.setOnClickListener {
            intent = (Intent().apply {
                action = Intent.ACTION_VIEW
                setData(Uri.parse("geo:0,0?q=Universidad+de+Huelva"))
                startActivity(this)
            })
        }



    }
}