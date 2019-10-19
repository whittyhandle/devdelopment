public class main {
    public static void main(String[] args) {
        System.out.println(getEvenDigitSum(123456789));

    }

    public static int getEvenDigitSum(int number){
        if (number < 0){
            return -1;

        }
        int sum = 0;
        int lastInt = 0;
        while (number > 0) {
            lastInt = number % 10;
            if (lastInt % 2 == 0) {
                sum += lastInt;
            }

            number /= 10;
        }
        return sum;
    }

}
