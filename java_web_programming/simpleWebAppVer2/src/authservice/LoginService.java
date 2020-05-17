package authservice;

public class LoginService {

        //typically this would connect to a database and perform the comparison
    public boolean authenticate(String userId, String password) {

        if (password.equals(null) || password.isEmpty()) {
            return false;
        }
        return true;
    }

}
