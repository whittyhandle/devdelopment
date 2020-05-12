package com.davidkittle;

public class Main {

    public static void main(String[] args) {
        int score;

        score = caclulateHighScorePosistion(1500);
        displayHighScorePosistion("test", score);
        score = caclulateHighScorePosistion(900);
        displayHighScorePosistion("test2", score);
        score = caclulateHighScorePosistion(400);
        displayHighScorePosistion("test3", score);
        score = caclulateHighScorePosistion(50);
        displayHighScorePosistion("test4", score);


    }

    public static void displayHighScorePosistion(String playerName, Integer score){
        System.out.println("The players name is " + playerName + " got into posistion " + score + " on the high score table");

    }

    public static int caclulateHighScorePosistion(Integer score){
        if(score >= 1000){
            return 1;
        } else if (score >= 500 && score < 1000){
            return 2;
        } else if (score >= 100 && score < 500){
            return 3;
        } else {
            return 4;
        }


    }
}
