public class main {
    public static void main(String[] args) {
        System.out.println(PerfectNumber(28));

    }

    public static boolean PerfectNumber (int number) {

        int TotalSum = 0;

        if (number < 1 ) {
            return false;
        }
        for (int i = 1; i < number ; i++) {
            if ( number % i== 0) {
                TotalSum += i;

            }

        }
        if (TotalSum == number) {
            return true;
        }
        return false;
    }

}
