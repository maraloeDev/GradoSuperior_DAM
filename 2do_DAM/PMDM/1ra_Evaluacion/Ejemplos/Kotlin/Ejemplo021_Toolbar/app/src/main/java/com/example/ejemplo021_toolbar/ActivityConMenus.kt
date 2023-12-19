package com.example.ejemplo021_toolbar

import android.view.Menu
import android.view.MenuItem
import androidx.appcompat.app.AppCompatActivity
import com.example.ejemplo021_toolbar.databinding.ActivityMainBinding
import com.google.android.material.snackbar.Snackbar

class ActivityConMenus : AppCompatActivity() {

    lateinit var binding: ActivityMainBinding


    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        menuInflater.inflate(R.menu.menu, menu)
        return super.onCreateOptionsMenu(menu)
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when (item.itemId) {
            R.id.item1 -> {
                Snackbar.make(binding.root, "Item 1", Snackbar.LENGTH_SHORT).show()
            }

            R.id.item2 -> {
                Snackbar.make(binding.root, "Item 2", Snackbar.LENGTH_SHORT).show()
            }
        }
        return super.onOptionsItemSelected(item)
    }


}