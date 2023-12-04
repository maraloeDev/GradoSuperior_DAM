package com.example.ejem16activitys

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import androidx.activity.result.contract.ActivityResultContracts
import com.example.ejem16activitys.databinding.ActivityMain2Binding
import com.example.ejem16activitys.databinding.ActivityMainBinding
import com.google.android.material.snackbar.Snackbar
import org.xml.sax.DTDHandler

class MainActivity : AppCompatActivity() {
    lateinit var binding: ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        Log.d("Depurando", "LLegamos al onCreate")
        var resultLauncher =
            registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
                if (result.resultCode == Activity.RESULT_OK) {
                    // There are no request codes
                    val data: Intent? = result.data
                    var valor: String? = data?.extras?.getString("datoDevuelto")
                    Snackbar.make(binding.root, valor as CharSequence, Snackbar.LENGTH_LONG).show()
                    /*
                    PARA DEVOLVER UN STRING
                    var datoDevuelto = data?.extras?.getString("dato")
                    Log.d("depurando", datoDevuelto.toString())
                     */
                } else if(result.resultCode == Activity.RESULT_CANCELED){
                    Snackbar.make(binding.root, "No se ha seleccionado ningun elemento", Snackbar.LENGTH_LONG).show()
                }
            }

        binding.bIniciarActivity2.setOnClickListener(View.OnClickListener {
            Log.d("Depurando", "LLegamos al onClickListener")
            val intent = Intent(this, MainActivity2::class.java)
            //intent.extras?.putSerializable("dato", Dato(binding.tietDato.text.toString()))
            //intent.extras?.putString("nombre",binding.tietDato.text.toString())
            //intent.extras?.putBundle() Se puede insertar cualquier cosa
            var bundle: Bundle = Bundle()
            /*bundle.putSerializable("dato",Dato(binding.tietDato.text.toString()))
            intent.putExtra("dato", bundle)
            Log.d("depurando", bundle.getSerializable("dato").toString())*/
            bundle.putParcelable("dato", DatoParcelable(binding.tietDato.text.toString()))
            intent.putExtra("dato", bundle)
            startActivity(intent)
        })
        binding.bIniciarActivityForResult.setOnClickListener(View.OnClickListener {
            val intent = Intent(this, MainActivityDevuelveDato::class.java)
            resultLauncher.launch(intent)
        })
    }

    override fun onStart() {
        super.onStart()
        Log.d("Depurando", "LLegamos al onStart")
    }

    override fun onResume() {
        super.onResume()
        Log.d("Depurando", "LLegamos al onResume")
    }
}