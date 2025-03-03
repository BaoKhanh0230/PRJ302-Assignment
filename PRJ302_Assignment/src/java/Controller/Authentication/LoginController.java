/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Authentication;

import DAL.EmployeeDBContext;
import DAL.UserDBContext;
import Model.Employee;
import Model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class LoginController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        UserDBContext db = new UserDBContext();
        User user = db.get(username, password);
        if(user != null){
            EmployeeDBContext edb = new EmployeeDBContext();
            Employee profile = edb.get(user.getEmployee().getId());
            profile.setManager(user.getEmployee().getManager());
            user.setEmployee(profile);
            
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            
            resp.sendRedirect("home");
        }
        else
            resp.getWriter().println("Access denied!");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("index.html").forward(request, response);
    }
}
