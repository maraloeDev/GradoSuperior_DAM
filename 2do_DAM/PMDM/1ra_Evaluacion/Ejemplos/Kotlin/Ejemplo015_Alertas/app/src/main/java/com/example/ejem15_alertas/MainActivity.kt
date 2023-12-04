package com.example.ejem15_alertas

import android.R
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.ImageView
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import com.bumptech.glide.Glide
import com.example.ejem15_alertas.databinding.ActivityMainBinding
import com.example.ejem15_alertas.databinding.CustomDialogBinding
import com.google.android.material.snackbar.Snackbar


class MainActivity : AppCompatActivity() {

    lateinit var binding : ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        //setContentView(R.layout.activity_main)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.bAlerta.setOnClickListener( View.OnClickListener {
            val builder = AlertDialog.Builder(this)
            builder.setTitle("Ventana alerta")
            builder.setMessage("Ejemplo de alerta")
            builder.setPositiveButton("OK") { dialog, which ->
                Snackbar.make(binding.root, "Has pulsado OK", Snackbar.LENGTH_LONG).show()
                dialog.cancel()
            }
            builder.setNegativeButton("Cancelar"){ dialog, which ->
                Snackbar.make(binding.root, "Has pulsado Cancelar", Snackbar.LENGTH_LONG).show()
                dialog.cancel()
            }
            builder.show()
        })

        binding.bSeleccionMultiple.setOnClickListener( View.OnClickListener {
            val listaOpciones: Array<String> = arrayOf("Opcion 1", "Opcion 2", "Opcion 3")
            val builder = AlertDialog.Builder(this)
         builder.setTitle("Ventana alerta")
            builder.setItems(listaOpciones) { dialog, which ->
                Snackbar.make(
                    binding.root,
                    "Has pulsado la opcion " + listaOpciones[which],
                    Snackbar.LENGTH_LONG
                ).show()
                dialog.cancel()
            }
         builder.show()

        })

        Glide.with(this).load("https://picsum.photos/400/400").into(binding.ivImagen)

        binding.bDialogoPersonalizado.setOnClickListener( View.OnClickListener {

            val builder = AlertDialog.Builder(this)
            val inflater =  layoutInflater
            var binding_customDialog = CustomDialogBinding.inflate(inflater)
            var dialogView=binding_customDialog.root

            Glide.with(this).load("https://picsum.photos/80/180").into(binding_customDialog.ivImagenAlertPersonalizado)

            builder.setView(dialogView)
            builder.setTitle("Diágolo personalizado de Alerta")
            builder.setPositiveButton("OK") { dialog, which ->
                var nombre : String =binding_customDialog.titNombre.text.toString()
                var soltero : Boolean = binding_customDialog.cbEstadoCivil.isChecked
                var ciudad : String = binding_customDialog.sCiudadNacimiento.selectedItem.toString()

                var usuario = Usuario(nombre, soltero, ciudad)
                Log.d("depurando", usuario.toString())
                binding.usuario = usuario

                Snackbar.make(binding.root, "Has pulsado OK", Snackbar.LENGTH_LONG).show()
                dialog.cancel()
            }

            builder.show()

        })



    }
}