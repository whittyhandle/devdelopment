import java.util.Scanner;

class Main {
    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        int num = input.nextInt();

        if (num <= 0) {
            System.out.println("NO");
        } else {
            System.out.println("YES");
        }

    }
}