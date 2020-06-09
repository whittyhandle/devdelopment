package com.kittled.demo;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final Button button = findViewById(R.id.btnClick);
        final ImageView catImg = (ImageView) findViewById(R.id.imgCat1);
        final int[] isClicked = {0};

        button.setOnClickListener((new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (isClicked[0] == 0) {
                    isClicked[0] = 1;
                    catImg.setImageResource(R.drawable.cat1);
                } else {
                    isClicked[0] = 0;
                    catImg.setImageResource(R.drawable.cat2);
                }


            }
        }));
    }
}