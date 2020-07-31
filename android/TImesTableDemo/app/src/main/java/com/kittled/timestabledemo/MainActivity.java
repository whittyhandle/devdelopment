package com.kittled.timestabledemo;
import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;
import android.os.Build;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.SeekBar;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    public void generateTimesTable(int timesTable){

        ListView listView = (ListView) findViewById(R.id.listView);

        ArrayList<Integer> arrayList = new ArrayList<>();
        for (int i = 1; i < 20; i++){
            arrayList.add(i * timesTable);
        }

        ArrayAdapter<Integer> arrayAdapter = new ArrayAdapter<Integer>(getApplicationContext(), android.R.layout.simple_list_item_1, arrayList);
        listView.setAdapter(arrayAdapter);

    }

    @RequiresApi(api = Build.VERSION_CODES.O)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final SeekBar timesTableSlider = (SeekBar) findViewById(R.id.seekBar);
        timesTableSlider.setMax(20);
        timesTableSlider.setMin(1);
        timesTableSlider.setProgress(10);

        timesTableSlider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {

                generateTimesTable(progress);

            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {

            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {

            }
        });

        generateTimesTable(10);

    }

}