package Controller.Authentication;

import Model.BaseModel;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public abstract class BaseRecordAccessControlByOwnerController<T extends BaseModel> extends BaseRequiredAuthenticationController {
    private boolean isAllowedAccess(T entity, User user){
        return (entity.getCreatedBy().getUsername().equals(user.getUsername()));
    }
    
    protected abstract T getModel(int id);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException{
        T model = getModel(Integer.parseInt(req.getParameter("id")));
        if(isAllowedAccess(model, user))
            doGet(req, resp, user, model);
        else
            resp.getWriter().println(getAccessDeniedMessage(user, model));
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException{
        T model = getModel(Integer.parseInt(req.getParameter("id")));
        if(isAllowedAccess(model, user))
            doPost(req, resp, user, model);
        else
            resp.getWriter().println(getAccessDeniedMessage(user, model));
    }
    
    protected abstract void doGet(HttpServletRequest req, HttpServletResponse resp, User user, T model) throws ServletException, IOException;
    protected abstract void doPost(HttpServletRequest req, HttpServletResponse resp, User user, T model) throws ServletException, IOException;
    protected abstract String getAccessDeniedMessage(User u, T model);
}
