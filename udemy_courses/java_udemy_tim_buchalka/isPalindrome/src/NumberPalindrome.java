public class NumberPalindrome {

    public static boolean isPalindrome(int number) {
        number = Math.abs(number);
        int myNum = number;
        System.out.println(myNum);
        int reverse = 0;
        while (number > 0) {
            int lastDigit = number % 10;
            reverse *= 10;
            reverse += lastDigit;
            number /= 10;


        }
        return reverse == myNum;

    }
}
