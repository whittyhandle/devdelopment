public class main {

    public static void main(String[] args) {
        System.out.println(isCatPlaying(true, 25));

    }

    public static boolean isCatPlaying(boolean summer, int temperature) {
        if (summer && temperature >= 25 && temperature <= 45){
            return true;
        }  if (temperature >= 25 && temperature <= 35){
            return false;
        }
        return false;
    }
}
