package com.example.ejer8_baloncesto;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;

import com.example.ejer8_baloncesto.databinding.ActivityMainBinding;
import com.google.android.material.button.MaterialButton;

public class MainActivity extends AppCompatActivity {

    ActivityMainBinding binding;
    int puntosvisit=0;
    int puntoslocal=0;
    int jugadores=14;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.activity_main);
        binding=ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());
        marcador();
        inicializar(binding.lyLocales);
        inicializar(binding.lyVisit);
    }

    private void marcador(){
        binding.tvMarcador.setText(getResources().getString(R.string.tantero,puntoslocal,puntosvisit));
    }


    public void inicializar(LinearLayout contenedor)
    {
        LinearLayout.LayoutParams parametros= new LinearLayout.LayoutParams(150, 150);
        for (int i=4;i<=jugadores;i++){
            Button boton=new Button(this);
            boton.setText(""+i);
            boton.setLayoutParams(parametros);
            contenedor.addView(boton);
            boton.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    if (binding.rbLibre.isChecked()){
                        if (((LinearLayout)v.getParent()).getId()==binding.lyLocales.getId())
                                puntoslocal+=1;
                        else
                                puntosvisit+=1;
                    }else if(binding.rbCanasta.isChecked()){
                        if (((LinearLayout)v.getParent()).getId()==binding.lyLocales.getId())
                            puntoslocal+=2;
                        else
                            puntosvisit+=2;
                    }else if(binding.rbTriple.isChecked()){
                        if (((LinearLayout)v.getParent()).getId()==binding.lyLocales.getId())
                            puntoslocal+=3;
                        else
                            puntosvisit+=3;
                    }
                    marcador();
                }
            });
        }
    }

}