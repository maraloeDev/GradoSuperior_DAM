package com.example.ejem14recycleviewcardview

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.constraintlayout.widget.ConstraintLayout
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.ejem14recycleviewcardview.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {
    lateinit var binding:ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        //binding.rvListado.layoutManager = LinearLayoutManager(this)
        binding.rvListado.layoutManager = LinearLayoutManager(this, LinearLayoutManager.HORIZONTAL, false)

        //binding.rvListado.layoutManager = GridLayoutManager(this,1)
        binding.rvListado.adapter = PersonasAdapter(PersonasProvider.datos)
    }


}