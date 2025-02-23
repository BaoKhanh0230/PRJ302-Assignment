package Controller.Authentication;

import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public abstract class BaseRequiredAuthenticationController extends HttpServlet {
    private User getLoggedUser(HttpServletRequest req){
        return (User) req.getSession().getAttribute("user");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User u = getLoggedUser(req);
        if(u !=  null){
            doPost(req, resp, u);
        }
        else{
            resp.getWriter().println("Access denied!");
        }
    }
    
    protected abstract void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException;
    protected abstract void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User u = getLoggedUser(req);
        if(u != null){
            doGet(req, resp, u);
        }
        else{
            resp.getWriter().println("Access denied!");
        }
    }
    
}
