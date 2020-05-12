public class sumDigits {

    public static void sumDigit(int number){

        if (number >= 10) {
            int sum = 0;
            while (number > 0 ) {
                int num = number % 10;
                number = number / 10;
                sum += num;

            } System.out.println(sum);
        }

    }
}
