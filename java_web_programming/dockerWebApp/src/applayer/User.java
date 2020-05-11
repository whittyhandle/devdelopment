package applayer;

public class User {


    public boolean isValidUserCreds(String UserName, String UserPassword) {

        if (UserName.equals("test") && UserPassword.equals("1234")) {
            return true;
        }
        return false;

    }
}
