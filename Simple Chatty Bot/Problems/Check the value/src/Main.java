// Posted from EduTools plugin
import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int num = scanner.nextInt();
        if (num < 10) {
            System.out.println(true);
        } else {
            System.out.println(false);
        }
    }
}