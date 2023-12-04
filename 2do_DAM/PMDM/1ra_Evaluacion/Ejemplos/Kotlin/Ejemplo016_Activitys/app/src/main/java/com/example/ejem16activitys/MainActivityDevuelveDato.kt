package com.example.ejem16activitys

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import com.example.ejem16activitys.databinding.ActivityMainDevuelveDatoBinding

class MainActivityDevuelveDato : AppCompatActivity() {
    lateinit var binding: ActivityMainDevuelveDatoBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainDevuelveDatoBinding.inflate(layoutInflater)
        setContentView(binding.root)
        binding.bDevolverDato.setOnClickListener(View.OnClickListener {
            val datoDevuelto = binding.spDatoDevuelto.selectedItem.toString()
            if (datoDevuelto == "Seleccione un elemento...") {
                setResult(RESULT_CANCELED)
            } else {
                intent.putExtra("datoDevuelto", datoDevuelto)
                setResult(RESULT_OK, intent)
            }
            finish()
        })
    }
}