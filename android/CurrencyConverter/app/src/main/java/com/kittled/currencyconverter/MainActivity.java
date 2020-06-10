package com.kittled.currencyconverter;

import androidx.appcompat.app.AppCompatActivity;

import android.nfc.Tag;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

    }


    public void conversion(View view){
        final Button button = findViewById(R.id.btnConvert);
        final EditText userInputText = (EditText) findViewById(R.id.txtInputNum);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String userNum = userInputText.getText().toString();
                double dblUserNum = Double.parseDouble(userNum);
                double euroAmount =  (dblUserNum * .88);

                Toast.makeText(getApplicationContext(), "€ " + String.format("%.2f", euroAmount), Toast.LENGTH_SHORT).show();

            }
        });

    }
}