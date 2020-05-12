public class SpeedConverter {

    public static long toMilesPerHours(double kilometersPerHour) {

        if (kilometersPerHour < 0){
            return -1;
        } else {
            return Math.round(kilometersPerHour / 1.609);
        }

    }

    public static void printConversion(double kilometersPerHour) {

        if (kilometersPerHour < 0) {
            System.out.println("Invalid value");
        } else {
            double MilesPerHour = toMilesPerHours(kilometersPerHour);
            System.out.println("kph: " + kilometersPerHour + " mph: " + MilesPerHour);
        }

    }


}
