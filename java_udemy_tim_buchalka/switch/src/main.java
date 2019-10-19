public class main {

    public static void main(String[] args) {
        int switchValue = 6;
        char switchValueChar = 'C';
        String switchValueString = "Test";

        switch (switchValue) {
            case 1:
                System.out.println("one");
                break;

            case 2:
                System.out.println("two");
                break;
            case 3: case 4: case 5:
                System.out.println("3,4,5");

            default:
                System.out.println("default");
                break;
        }

        switch (switchValueChar) {
            case 'A':
                System.out.println("A");
                break;

            case 'B':
                 System.out.println("B");
                 break;

            case 'C': case 'D': case 'E':
                System.out.println("C,D, or E");
                break;

             default:
                 System.out.println("default");
                 break;

        }

        switch (switchValueString.toLowerCase()) {
            case "test":
                System.out.println("test");
                break;

             default:
                 System.out.println("not a test");
                 break;
        }


    }


}
