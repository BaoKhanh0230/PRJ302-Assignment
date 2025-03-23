/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.User;

import DAL.FormDAO;
import Model.LeaveForm;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import java.io.IOException;

public class UpdateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String formId = req.getParameter("id");
        if (formId != null) {
            FormDAO fd = new FormDAO();
            LeaveForm form = fd.getFormById(Integer.parseInt(formId));
            req.setAttribute("form", form);
            req.getRequestDispatcher("/view/home/editForm.jsp").forward(req, resp);
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Form ID is missing");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String formId = req.getParameter("id");
        String fromDateStr = req.getParameter("fromDate");
        String toDateStr = req.getParameter("toDate");
        String reason = req.getParameter("reason");

        java.sql.Date fromDate = java.sql.Date.valueOf(fromDateStr);
        java.sql.Date toDate = java.sql.Date.valueOf(toDateStr);

        FormDAO fd = new FormDAO();
        fd.updateForm(Integer.parseInt(formId), fromDate, toDate, reason);

        resp.sendRedirect(req.getContextPath() + "/user/list");
    }
}