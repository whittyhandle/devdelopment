package com.example.randomizer;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.SeekBar;
import android.widget.TextView;

import java.util.Random;

public class MainActivity extends AppCompatActivity {
     private Button rollButton;
     private TextView viewResults;
     private SeekBar seekBar;


    @RequiresApi(api = Build.VERSION_CODES.M)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

         rollButton = (Button) findViewById(R.id.btnRoll);
         viewResults = (TextView) findViewById(R.id.txtViewResults);
         seekBar= (SeekBar) findViewById(R.id.seekBar);

        rollButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int rand = new Random().nextInt(seekBar.getProgress());
                viewResults.setText(String.valueOf(rand + 1));

            }
        });

    }
}
