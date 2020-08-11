package com.kittled.getrandworddemo;
import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Header;
import retrofit2.http.Headers;

public interface GetData {

    String BASE_URL = "https://api.wordnik.com/";

    @Headers({
            "hasDictionaryDef: true",
            "maxCorpusCount: -1",
            "minDictionaryCount: 1",
            "hasDictionaryDef: true",
            "maxDictionaryCount: -1",
            "minLength: 5",
            "maxLength: -1",
            "limit: 10"})
    @GET("v4/words.json/randomWords")
    //@GET("v4/words.json/randomWords?&maxCorpusCount=-1&minDictionaryCount=1&maxDictionaryCount=-1&minLength=5&maxLength=-1&limit=10&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")
    Call<List<Words>> getWords(@Header("api_key") String api_key);


}
