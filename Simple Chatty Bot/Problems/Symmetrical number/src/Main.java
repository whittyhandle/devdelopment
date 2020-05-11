import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        int retNum = 2;
        Scanner sc = new Scanner(System.in);
        int num = sc.nextInt();
        int ogNum = num;
        int revNum = 0;

        while (num > 0) {
            revNum = revNum * 10 + num % 10;
            num /= 10;
        }

        if (ogNum == revNum) {
            retNum = 1;
        }

        System.out.println(retNum);
    }
}