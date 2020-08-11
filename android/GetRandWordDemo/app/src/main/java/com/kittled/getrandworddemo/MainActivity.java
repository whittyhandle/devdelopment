package com.kittled.getrandworddemo;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.DialogTitle;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Toast;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class MainActivity extends AppCompatActivity {
    private static final String TAG = "MainActivity";
    ListView listView;
    String[] words;

    public void populateWordList () {
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(GetData.BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();

        GetData getData = retrofit.create(GetData.class);
        Call<List<Words>> call = getData.getWords("a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5");

        call.enqueue(new Callback<List<Words>>() {
            @Override
            public void onResponse(Call<List<Words>> call, Response<List<Words>> response) {
                List<Words> wordList = response.body();

                words = new String[wordList.size()];

                for (int i = 0; i < wordList.size(); i++) {
                    words[i] = wordList.get(i).getWord();

                }
                listView.setAdapter(new ArrayAdapter<String>(getApplicationContext(), android.R.layout.simple_list_item_1,words));
            }

            @Override
            public void onFailure(Call<List<Words>> call, Throwable t) {
                Toast.makeText(getApplicationContext(), t.getMessage(), Toast.LENGTH_SHORT).show();
            }
        });
    }

    public void newWordList(View view) {
        final Button button = findViewById(R.id.btnNewWordList);
        populateWordList();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        listView = findViewById(R.id.listView);

        populateWordList();


        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                String selectedWord = (String) listView.getItemAtPosition(position);
                Log.i(TAG, "onItemClick: " + selectedWord);

            }});


    }



}