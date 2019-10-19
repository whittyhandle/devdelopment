public class calcualteFeetAndInchesToCentimeters {

    public static void main(String[] args) {
        System.out.println(calcualteFeetAndInchesToCentimeters(-100));

    }

    public static double calcualteFeetAndInchesToCentimeters(double feet, double inches){

        if (feet >= 0 || ( inches >= 0 && inches <= 12)){
            double centimeters = (feet * 12) * 2.54;
            centimeters += inches * 2.54;
            System.out.println(feet + " feet, " + inches + " inches = " + centimeters + " cm");
            return centimeters;
        }

        return -1;
    }

    public static double calcualteFeetAndInchesToCentimeters(double inches){

        if (inches >= 0){
            double feet = (int) inches / 12;
            double remainingInches = (int) inches % 12;
            System.out.println(inches + " inches is equal to " + feet + " feet and " + remainingInches + " inches");
            return calcualteFeetAndInchesToCentimeters(feet, remainingInches);

        }
        return -1;

    }
}
