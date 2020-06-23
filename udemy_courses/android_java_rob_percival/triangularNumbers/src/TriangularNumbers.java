public class TriangularNumbers {

    public static void main(String[] args) {
        System.out.println("Hello World");
        for (int i = 1; i <= 10; i++) {
            System.out.println(triNum(i));
        }

    }

    public static int triNum(int n){
        return n*(n+1)/2;
    }

}
