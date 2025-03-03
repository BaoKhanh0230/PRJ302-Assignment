/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.User;

import Controller.Authentication.BaseRequiredAuthenticationController;
import DAL.FormDAO;
import Model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class RejectController extends BaseRequiredAuthenticationController {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        String username = req.getParameter("username");
        String role = req.getParameter("role");
        String department = req.getParameter("department");
        String fromDate = req.getParameter("fromDay");
        String toDate = req.getParameter("toDay");
        String status = "Rejected";
        
        FormDAO fd = new FormDAO();
        fd.updateFormStatus(username, role, department, fromDate, toDate, status);
        
        resp.sendRedirect(req.getContextPath() + "/home");
    }

}
