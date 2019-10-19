public class main {
    public static void main(String[] args) {
        dubstep(" test ");
        System.out.println(dubstep("R L"));
    }

    public static String dubstep(String song) {
        for (int i = 0; i < song.length(); i++) {
            String c = song.replace("WUB", " ");
            return c.trim().replaceAll(" +", " ");

        }
        return "failed";
    }
}
