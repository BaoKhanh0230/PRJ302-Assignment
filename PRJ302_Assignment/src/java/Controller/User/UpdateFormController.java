/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.User;

import Controller.Authentication.BaseRequiredAuthenticationController;
import DAL.FormDAO;
import Model.Employee;
import Model.LeaveForm;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class UpdateFormController extends BaseRequiredAuthenticationController {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        ArrayList<Employee> emps = user.getEmployee().getStaffs();

        FormDAO fd = new FormDAO();
        ArrayList<LeaveForm> updateableForms = fd.selectUpdateableForms(emps, user);
        req.setAttribute("listForm", updateableForms);

        req.getRequestDispatcher("/view/home/updateList.jsp").forward(req, resp);
    }
}
