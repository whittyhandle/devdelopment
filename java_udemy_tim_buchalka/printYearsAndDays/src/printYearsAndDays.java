public class printYearsAndDays {
    public static void main(String[] args) {
        printYearsAndDays.printYearsAndDays(1440);

    }

    public static void printYearsAndDays(long minutes){
        if(minutes < 0){
            System.out.println("Invalid value");
        } else {
            long hours = minutes / 60;
            long days = hours / 24;
            long year = days / 365;
            long remainingDays = days % 365;
            System.out.println(minutes + " min = " + year + " y and " + remainingDays + " d");

        }

    }
}
