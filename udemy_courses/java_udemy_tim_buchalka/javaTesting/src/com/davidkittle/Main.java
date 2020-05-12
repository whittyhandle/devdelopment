package com.davidkittle;

public class Main {

    public static void main(String[] args) {
	// write your code here
        int myNum;

        myNum = testTwo(100);
        testOne("test", myNum);
    }

    public static void testOne(String myName, Integer myNum){
        System.out.println("My name is " + myName + " my num is " + myNum);

    }

    public static int testTwo(Integer myNum){

        int output = 3;
        if (myNum < 100) {
            output = 1;
        } else {
            output = 2;
        }
        return output;
    }


}
