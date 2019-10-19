public class getDurationString {
    public static void main(String[] args) {
        System.out.println(getDurationString(3945));

    }

    public static String getDurationString(int minutes, int seconds){

        if ((minutes >= 0) && (seconds >= 0 && seconds <= 59)){
            int hours = minutes / 60;
            int remainingMin = minutes % 60;
            return "h " + hours +  " m "+ remainingMin + " s "+ seconds;
        }
        return "Invalid";

    }

    public static String getDurationString(int seconds){

        if (seconds >= 0){
            int minutes = seconds /60;
            int rseconds = seconds % 60;
            return getDurationString(minutes, rseconds);

        }
        return  "Invalid";


    }


}
