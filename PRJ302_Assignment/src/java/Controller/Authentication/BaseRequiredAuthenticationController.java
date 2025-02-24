package Controller.Authentication;

import Model.Feature;
import Model.Role;
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
    
    private boolean isAllowedAccess(User u, HttpServletRequest req){
        String current_endpoint = req.getServletPath();
        for(Role role : u.getRoles()){
            for(Feature feature : role.getFeatures()){
                if(feature.getUrl().equals(current_endpoint))
                    return true;
            }
        }
        return false;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User u = getLoggedUser(req);
        if(u !=  null && isAllowedAccess(u, req)){
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
        if(u != null && isAllowedAccess(u, req)){
            doGet(req, resp, u);
        }
        else{
            resp.getWriter().println("Access denied!");
        }
    }
}
