public class ObjNumber {

    int number;

    public String result(boolean isPositive) {
        if(isPositive){
            return "the number was positive";
        } else {
            return "the number was negative";
        }
    }

    public boolean isPositive(int number) {
        if (number < 0) {
            return false;
        } else {
           return true;
        }
    }

}
