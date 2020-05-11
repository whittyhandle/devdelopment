import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        String yn = "NO";
        Scanner sc = new Scanner(System.in);
        int A = sc.nextInt();
        int B = sc.nextInt();
        int C = sc.nextInt();

        if ((A + B > C) &&  (A + C > B) && (B + C > A)){
            yn = "YES";
        }

        System.out.println(yn);

    }
}