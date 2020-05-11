import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a = sc.nextInt();
        int b = sc.nextInt();
        float sum = 0;
        int count = 0;
        for(int i=a ; i<=b; i++ ) {
            if (i % 3 == 0){
                count++;
                sum+=i;
            }
        }
        System.out.println(sum/count);

    }
}