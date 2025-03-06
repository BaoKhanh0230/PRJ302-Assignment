package Controller.User;

import Controller.Authentication.BaseRequiredAuthenticationController;
import DAL.FormDAO;
import Model.LeaveForm;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;


public class CreateFormController extends BaseRequiredAuthenticationController {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        /*req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");*/
        
        LeaveForm lf = new LeaveForm();
        lf.setFrom(Date.valueOf(req.getParameter("from")));
        lf.setTo(Date.valueOf(req.getParameter("to")));
        lf.setReason(req.getParameter("reason"));
        lf.setStatus("In progress");
        lf.setCreatedBy(user.getEmployee().getName());
        lf.setProcessedBy("");
        if(Date.valueOf(req.getParameter("from")).before(Date.valueOf(req.getParameter("to"))) || Date.valueOf(req.getParameter("from")).before(Date.valueOf(req.getParameter("to")))){
            FormDAO fd = new FormDAO();
            fd.insert(lf);
        }
        else if(Date.valueOf(req.getParameter("from")).after(Date.valueOf(req.getParameter("to"))))
            req.getRequestDispatcher("/view/home/create.jsp").forward(req, resp);
        
        /*String username = user.getEmployee().getName();
        String role = req.getParameter("role");
        String department = req.getParameter("department");
        String fromDate = req.getParameter("fromDate");
        String toDate = req.getParameter("toDate");
        String reason = req.getParameter("reason");
        String status = "In progress";
        String processedBy = "";

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            java.util.Date parsedFromDate = sdf.parse(fromDate);
            java.util.Date parsedToDate = sdf.parse(toDate);
            java.sql.Date firstDate = new java.sql.Date(parsedFromDate.getTime());
            java.sql.Date secondDate = new java.sql.Date(parsedToDate.getTime());
            if (firstDate.before(secondDate) || firstDate.equals(secondDate)) {
                FormDAO fd = new FormDAO();
                fd.insert(username, role, department, fromDate, toDate, reason, status, processedBy);
                resp.sendRedirect(req.getContextPath() + "/user/list");
            } else if (firstDate.after(secondDate)) {
                req.getRequestDispatcher("/view/home/create.jsp").forward(req, resp);
            }
        } catch (ParseException ex) {
            Logger.getLogger(CreateFormController.class.getName()).log(Level.SEVERE, null, ex);
        }*/
        resp.sendRedirect(req.getContextPath() + "/user/list");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        req.getRequestDispatcher("/view/home/create.jsp").forward(req, resp);
        }
    }
