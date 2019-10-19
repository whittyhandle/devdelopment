public class main {
    public static void main(String[] args) {
        System.out.println(GreatestCommonDivisor(81, 153));

    }

    public static int GreatestCommonDivisor(int first, int second) {
        if (first < 10 || second < 10) {
            return -1;
        }

        while (second > 0){
           int temp = second;
            second = first % second;
            first = temp;
        }
        return first;
    }
}
