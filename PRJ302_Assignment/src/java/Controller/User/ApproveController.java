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
import java.sql.*;

/**
 *
 * @author Admin
 */
public class ApproveController extends BaseRequiredAuthenticationController {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        Date from = Date.valueOf(req.getParameter("from"));
        Date to = Date.valueOf(req.getParameter("to"));
        String reason = req.getParameter("reason");
        String createdBy = req.getParameter("createdBy");
        String status;
        if(req.getParameter("status").equalsIgnoreCase("1")){
            status = "Approved";
        }
        else{
            status = "Rejected";
        }
        
        String processedBy = user.getEmployee().getName();
        
        FormDAO fd = new FormDAO();
        fd.updateFormStatus(from, to, reason, createdBy, status, processedBy);
        
        resp.sendRedirect(req.getContextPath() + "/home");
    }
}
