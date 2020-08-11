package com.kittled.getrandworddemo;

import com.google.gson.annotations.SerializedName;

import java.util.Arrays;

public class Words {

    @SerializedName("word")
    private String word;

    public Words(String word) {
        this.word = word;
    }

    public String getWord() {
        return word;
    }

    @Override
    public String toString() {
        return "Words{" +
                "word='" + word + '\'' +
                '}';
    }
}
