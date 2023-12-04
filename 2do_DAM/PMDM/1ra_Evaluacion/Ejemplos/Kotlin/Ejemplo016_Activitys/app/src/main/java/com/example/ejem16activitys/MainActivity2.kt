package com.example.ejem16activitys

import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import androidx.annotation.RequiresApi
import com.example.ejem16activitys.databinding.ActivityMain2Binding

class MainActivity2 : AppCompatActivity() {
    lateinit var  binding: ActivityMain2Binding
    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMain2Binding.inflate(layoutInflater)
        setContentView(binding.root)
        var bundle:Bundle? =  intent.getBundleExtra("dato")
        //Log.d("depurando", "desde MainActivity2: "+bundle?.getSerializable("dato").toString())
        //binding.datoRecibido = bundle?.getSerializable("dato") as Dato
        var dato:DatoParcelable? =bundle?.getParcelable("dato", DatoParcelable::class.java)
        binding.datoRecibido = dato

        binding.bFinalizar.setOnClickListener(View.OnClickListener{
            Log.d("Depurando", "Llegando al setOnClickListener Finalizar")
            finish()
        })

    }
}