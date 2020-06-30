package com.kittled.trianglesandsquares;

import androidx.appcompat.app.AppCompatActivity;
import androidx.lifecycle.ViewModelProvider;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {


    Number mynum = new Number();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

    }

    public void onClick(View v) {
        final Button button = findViewById(R.id.button);
        final EditText userInput = (EditText) findViewById(R.id.editTextNumber);
        String message = "Enter a number";

        if(userInput.getText().toString().isEmpty()){
            Toast.makeText(getApplicationContext(),message, Toast.LENGTH_SHORT).show();
        } else {
            int num = Integer.parseInt(userInput.getText().toString());
            Toast.makeText(getApplicationContext(), mynum.results(mynum.nums(num), mynum.numt(num)), Toast.LENGTH_SHORT).show();
        }
    }
}