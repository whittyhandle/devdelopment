public class main {
    public static void main(String[] args) {
        System.out.println(sharedDigit(9, 99));
    }

    public static boolean sharedDigit(int numOne, int numTwo){
        int remOne = 0;
        int remTwo = 0;
        if ((numOne < 10 || numOne > 99) || (numTwo < 10 || numTwo > 99)){
            return false;
        }
        int numOneA = numOne % 10;
        int numOneB = numOne / 10;
        int numTwoA = numTwo % 10;
        int numTwoB = numTwo / 10;
        if (numOneA == numTwoA || numOneA == numTwoB || numOneB == numTwoA || numOneB == numTwoB){
            return true;

        }
        return false;
    }
}
