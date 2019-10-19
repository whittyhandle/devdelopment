public class main {
    public static void main(String[] args) {
        System.out.println(FirstLastDigitSum(3234));

    }

    public static int FirstLastDigitSum(int number) {
        if (number < 0){
            return -1;

        }
        int myNum = Math.abs(number);
        int lastDigit = myNum % 10;
                while ((myNum / 10) > 0 ) {
                   myNum /= 10;

                }
        return myNum + lastDigit;
    }
}


