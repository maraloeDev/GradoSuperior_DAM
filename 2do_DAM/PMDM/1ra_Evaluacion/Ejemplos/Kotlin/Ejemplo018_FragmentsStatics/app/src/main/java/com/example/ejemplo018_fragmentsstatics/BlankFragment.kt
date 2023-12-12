package com.example.ejemplo018_fragmentsstatics

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.example.ejemplo018_fragmentsstatics.databinding.FragmentBlankBinding


class BlankFragment : Fragment() {

    lateinit var binding: FragmentBlankBinding
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {

        binding = FragmentBlankBinding.inflate(inflater, container, false)

        binding.bFragment.setOnClickListener {
            binding.tvdelFragment.text = "Hola desde el fragmento"
            (activity as EscuchadordeFragmentEstatico).onFragmentInteraction()
        }

        return binding.root
        // Inflate the layout for this fragment
        //return inflater.inflate(R.layout.fragment_blank, container, false)
    }

    interface EscuchadordeFragmentEstatico {
        fun onFragmentInteraction()
    }


}