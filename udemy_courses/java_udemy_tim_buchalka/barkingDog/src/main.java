public class main {

    public static void main(String[] args) {
        boolean test = shouldWakeUp(true, 9);
        System.out.println(test);

    }

    public static boolean shouldWakeUp(boolean barking, int hourOfDay) {
        if (hourOfDay < 0 || hourOfDay > 23){
        } else if (barking) {
            if (hourOfDay < 8 || hourOfDay > 22) {
                return true;
            }
        }
        return false;

    }

}
