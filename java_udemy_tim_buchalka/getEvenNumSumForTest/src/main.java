public class main {
    public static void main(String[] args) {
        getEvenDigitSumForLoop(123456789);
    }

    public static void getEvenDigitSumForLoop (int num){
        int sum = 0;
        int lastInt = 0;
        for (int i = 0; i < num; i++) {
            lastInt = num % 10;
            if (lastInt % 2 == 0) {
                sum += lastInt;

            }
            num /= 10;
        }
        System.out.println(sum);

    }
}
