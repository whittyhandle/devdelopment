import java.util.Arrays;
import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        //System.out.println("Enter the length of the array:");
        int length = s.nextInt();
        int [] myArray = new int[length];
        //System.out.println("Enter the elements of the array:");
        int sum = 0;
        for(int i=0; i<length; i++ ) {
            myArray[i] = s.nextInt();
            if (myArray[i] % 6 == 0){
                    sum += myArray[i];
            }
        }
        System.out.println(sum);

    }
}


