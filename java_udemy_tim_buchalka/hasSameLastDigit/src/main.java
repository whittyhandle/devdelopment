public class main {
    public static void main(String[] args) {
        System.out.println(LastDigitChaecker(9, 99, 999));
        System.out.println(isValid(1051));

    }
    public static boolean LastDigitChaecker(int numOne, int numTwo, int numThree){
        if (numOne < 10 || numOne > 1000 || numTwo < 10 || numTwo > 1000 || numThree < 10 || numThree > 1000){
            return false;

        }
        int numOneA = numOne % 10;
        int numTwoA = numTwo % 10;
        int numThreeA = numThree % 10;
        if (numOneA == numTwoA || numOneA == numThreeA || numTwoA == numThreeA){
            return true;

        }

        return false;
    }

    public static boolean isValid(int numOne){
        if (numOne < 10 || numOne > 1000){
            return false;
        }

        return true;
    }

}
