package com.example.corregido;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ArrayAdapter;

import com.example.corregido.databinding.ActivityMainBinding;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
	ActivityMainBinding binding;
	private ArrayList<Alumno> alumnos;
	private int numSuspensos;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		numSuspensos=0;
		binding= ActivityMainBinding.inflate(getLayoutInflater());
		setContentView(binding.getRoot());
		insertarAlumnoInicial();
		configListView();

	}
	private void insertarAlumnoInicial(){
		binding.setAlumno(new Alumno("Carlos",""));
	}
	private void configListView(){
		alumnos= new ArrayList<>();
		binding.lvAlumnos.setAdapter(new ArrayAdapter<>(this, android.R.layout.simple_list_item_1,alumnos));
		binding.lvAlumnos.setOnItemClickListener((parent, view, position, id) -> {
			Log.d("depurando",((Alumno)binding.lvAlumnos.getItemAtPosition(position)).getNombre()+", "+((Alumno)binding.lvAlumnos.getItemAtPosition(position)).getCalificacion());
		});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		getMenuInflater().inflate(R.menu.menu,menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(@NonNull MenuItem item) {
		if (item.getItemId()==R.id.save){
			Alumno a;
			if(binding.etNombre.getText().toString().isEmpty()){
				a = new Alumno("--------",binding.spCalifica.getSelectedItem().toString());
			}else{
				a = new Alumno(binding.etNombre.getText().toString(),binding.spCalifica.getSelectedItem().toString());
			}

			alumnos.add(a);
			((ArrayAdapter)binding.lvAlumnos.getAdapter()).notifyDataSetChanged();
			if(a.getCalificacion().equals(getResources().getStringArray(R.array.califications)[0])){
				numSuspensos++;
				binding.tv9.setText(getResources().getQuantityString(R.plurals.not_passedCount,numSuspensos,numSuspensos));
			}
		}
		return super.onOptionsItemSelected(item);
	}
}