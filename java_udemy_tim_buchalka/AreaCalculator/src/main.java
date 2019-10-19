public class main {

    public static void main(String[] args) {
        System.out.println(area(-1));
        System.out.println(area(4,4));

    }

    public static double area(double radius){
        if(radius < 0 ){
            return -1;
        }

        double area = (radius * radius) * Math.PI;
        return area;


    }

    public static double area(double x, double y){

        if(x < 0 || y < 0){
            return -1;
        }
        double area = x * y;
        return area;
    }


    }
