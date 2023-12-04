package com.example.ejem14recycleviewcardview

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.example.ejem14recycleviewcardview.databinding.ViewPersonaBinding

class PersonasAdapter(val datos: ArrayList<Persona>): RecyclerView.Adapter<PersonasAdapter.PersonasViewHolder>() {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): PersonasViewHolder {
        //CONTRUYE LAS ESTRUCTURA COMPLETA DE LA LISTA
        var inflater = LayoutInflater.from(parent.context)
        return PersonasViewHolder(inflater.inflate(R.layout.view_persona, parent,false))
    }

    override fun getItemCount(): Int = datos.size
    /* override fun getItemCount(): Int {
        //EL NUMERO DE ITEMS DE LA LISTA
        return PersonasProvider.datos.size
    }*/

    override fun onBindViewHolder(holder: PersonasAdapter.PersonasViewHolder, position: Int) {
        val persona: Persona = datos[position]
       holder.bind(persona)
    }


    class PersonasViewHolder(itemView: View): RecyclerView.ViewHolder(itemView) {
         val binding = ViewPersonaBinding.bind(itemView)
        fun bind(persona:Persona){
            binding.persona = persona
        }
    }

}



