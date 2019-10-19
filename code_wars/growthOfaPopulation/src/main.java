public class main {
    public static void main(String[] args) {
        System.out.println(nbYear(1000, 2, 100, 5000));
    }
    public static int nbYear(int p0, double percent, int aug, int p)  {
        percent /= 100;
        int x = 0;
        for (int i = 0; p0 < p; i++) {
            p0 = (int) (p0 + p0 * percent + aug);
            System.out.println(p0);
            x = i + 1;


        }
        return x;
    }
}
