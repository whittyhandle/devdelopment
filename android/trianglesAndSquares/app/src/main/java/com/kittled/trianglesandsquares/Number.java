package com.kittled.trianglesandsquares;

import android.content.Context;
import android.util.Log;
import android.widget.Toast;

public class Number {


    String message= "";
    String numIsBoth = "number is both square and triangle";
    String numIsTri = "number is a triangle";
    String numIsSqr = "number is a square";
    String numIsNeither = "number is neither square and triangle";

    public static boolean nums(int number){
        double squareRoot = Math.sqrt(number);

        if (squareRoot == Math.floor(squareRoot)) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean numt(int number){
        int x  = 1;
        int triangleNumber = 1;
        while (triangleNumber < number) {
            x++;
            triangleNumber = triangleNumber + x;
        }

        if (triangleNumber == number) {
            return true;
        } else {
            return false;
        }
    }

    public String results(boolean numSqrt, boolean triNum){
        if(triNum == true  && numSqrt == true) {
            message = numIsBoth;
        } else if (triNum == true){
            message = numIsTri;
        } else if (numSqrt ==true) {
            message = numIsSqr;
        } else {
            message = numIsNeither;
        }

        return message;
    }

}
