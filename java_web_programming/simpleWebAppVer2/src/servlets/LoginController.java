package servlets;

import authservice.LoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
// changed the url Mapping on line 10
@WebServlet(name = "login")
public class LoginController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // create an instance on business service to have access to the methods for validation
        LoginService loginservice = new LoginService();
        // need to capture the values from the JSP
        // 1st thing is get the requests
        String userId, password;

        // value of the parameter is the same as the name of the text box in the JSP
        request.setAttribute("userId", request.getParameter("userId"));
        request.setAttribute("password", request.getParameter("password"));

        // need to have a business service to handle the authentication request
        // not the job of the controller
        // redirect to another JSP using the response object
        if (loginservice.authenticate(request.getParameter("userId"), request.getParameter("password"))) {
            request.getRequestDispatcher("/success.jsp").forward(request,response);
        } else {
            request.setAttribute("errorMessage", "Invalid login User and password.");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }


    }

}
