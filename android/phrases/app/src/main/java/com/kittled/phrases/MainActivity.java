package com.kittled.phrases;

import androidx.appcompat.app.AppCompatActivity;

import android.media.MediaPlayer;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {

    public void playAudio(View view){
        int buttonId = view.getId();
        Button b = (Button)view;
        String buttonText = b.getText().toString().toLowerCase().replaceAll("\\s+","");
        MediaPlayer mediaPlayer = MediaPlayer.create(this, getResources().getIdentifier(buttonText, "raw", getPackageName()));
        mediaPlayer.start();


    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}