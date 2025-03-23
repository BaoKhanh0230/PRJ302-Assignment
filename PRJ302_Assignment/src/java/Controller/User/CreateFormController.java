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
        LeaveForm lf = new LeaveForm();
        lf.setFrom(Date.valueOf(req.getParameter("from")));
        lf.setTo(Date.valueOf(req.getParameter("to")));
        lf.setReason(req.getParameter("reason"));
        lf.setStatus("In progress");
        lf.setCreatedBy(user.getEmployee().getName());
        lf.setProcessedBy("");
        if(Date.valueOf(req.getParameter("from")).before(Date.valueOf(req.getParameter("to"))) || Date.valueOf(req.getParameter("from")).equals(Date.valueOf(req.getParameter("to")))){
            FormDAO fd = new FormDAO();
            fd.insert(lf);
        }
        else if(Date.valueOf(req.getParameter("from")).after(Date.valueOf(req.getParameter("to"))))
            req.getRequestDispatcher("/view/home/create.jsp").forward(req, resp);
        resp.sendRedirect(req.getContextPath() + "/user/list");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        req.getRequestDispatcher("/view/home/create.jsp").forward(req, resp);
        }
    }
