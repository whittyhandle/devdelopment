public class main {
    public static void main(String[] args) {
       printDaysOfTheWeek(9);
       printDayofTheWeek(0);

    }

    public static void printDaysOfTheWeek (int Day) {
        switch (Day) {

            case 1:
                System.out.println("Sunday");
                break;
            case 2:
                System.out.println("Monday");
                break;
            case 3:
                System.out.println("Tuesday");
                break;
            default:
                System.out.println("default");
                break;

        }


    }

    public static void printDayofTheWeek(int Day){

        if (Day == 1) {
            System.out.println("Sunday");

        } else if (Day == 1) {
            System.out.println("Monday");

        } else if (Day == 3) {
            System.out.println("Tuesday");

        } else {
            System.out.println("default");
        }


    }
}
