package com.kittled.guessinggame;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import java.util.Random;

public class MainActivity extends AppCompatActivity {
    int randomNum = new Random().nextInt((21) + 1);
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void makeToast(String string){
        Toast.makeText(getApplicationContext(), string, Toast.LENGTH_SHORT).show();
    }

    public void guess(View view) {
        final Button button = findViewById(R.id.btnGuess);
        final EditText userInput = (EditText) findViewById(R.id.txtGuess);
        int userGuess = Integer.parseInt(userInput.getText().toString());

        Log.i("test", "test test test " + randomNum);
        if (userGuess < randomNum) {
            makeToast("to low");
        } else if (userGuess > randomNum) {
            makeToast("to high");
        } else  {
            makeToast("bringo");
            randomNum = new Random().nextInt((21) + 1);
        }


    }
}