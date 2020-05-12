import java.util.Scanner;
import java.util.stream.IntStream;

class Main {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        int a = sc.nextInt();
        int b = sc.nextInt();
        int n = sc.nextInt();
        int count = 0;
        for (int i = a; i <= b ; i++) {
            if (i % n == 0) {
                ++count;
            }
        }
        System.out.println(count);
    }
}