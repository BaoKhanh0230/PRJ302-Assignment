package Controller.User;

import Controller.Authentication.BaseRequiredAuthenticationController;
import DAL.FormDAO;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;


public class CreateFormController extends BaseRequiredAuthenticationController {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        
        String username = user.getEmployee().getName();
        String role = req.getParameter("role");
        String department = req.getParameter("department");
        String fromDate = req.getParameter("fromDate");
        String toDate = req.getParameter("toDate");
        String reason = req.getParameter("reason");
        
        FormDAO fd = new FormDAO();
        fd.insert(username, role, department, fromDate, toDate, reason);
        resp.sendRedirect(req.getContextPath() + "/user/list");
        
        /*resp.getWriter().println(username + "\n" + role + "\n" + department + "\n" + fromDate + "\n"
        + toDate + "\n" + reason);*/
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        req.getRequestDispatcher("/view/home/create.jsp").forward(req, resp);
    }
}
