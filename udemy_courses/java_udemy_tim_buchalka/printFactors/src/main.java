public class main {
    public static void main(String[] args) {
        factorPrint(6);
        FactorPrint(32);

    }



    public static void factorPrint(int number){
        if (number < 1 ){
            System.out.println("Invalid Value");
        } else {

            for (int i = 1; i <= number; i++) {
                if (number % i == 0){
                    System.out.println(i);
                }

            }
        }


    }

    public static void FactorPrint(int number){
        int value = 1;
        while (value <= number){
            if (number % value == 0){
                System.out.println(value);
                value++;
            }
            value ++;



        }

    }



}
