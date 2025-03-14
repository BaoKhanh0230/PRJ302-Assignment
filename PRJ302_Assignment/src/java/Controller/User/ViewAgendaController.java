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
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class ViewAgendaController extends BaseRequiredAuthenticationController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        /*LocalDate startDate = LocalDate.of(2025, 3, 1); // Adjust as needed
        LocalDate endDate = LocalDate.of(2025, 3, 9);   // Adjust as needed*/
        
        String startStr = req.getParameter("start");
        String endStr = req.getParameter("end");

        LocalDate startDate, endDate;
        try {
            // Default to Jan 1, 2025, if no start date is provided
            startDate = (startStr != null && !startStr.isEmpty()) 
                ? LocalDate.parse(startStr) 
                : LocalDate.of(2025, 1, 1);
            
            // Default to Sep 1, 2025, if no end date is provided
            endDate = (endStr != null && !endStr.isEmpty()) 
                ? LocalDate.parse(endStr) 
                : LocalDate.of(2025, 9, 1);

            // Ensure end date is not before start date
            if (endDate.isBefore(startDate)) {
                throw new IllegalArgumentException("End date cannot be before start date.");
            }
        } catch (DateTimeParseException | IllegalArgumentException e) {
            req.setAttribute("error", "Invalid date format or range. Use YYYY-MM-DD (e.g., 2025-01-01).");
            startDate = LocalDate.of(2025, 1, 1); // Default start date
            endDate = LocalDate.of(2025, 9, 1);   // Default end date
        }

        // Fetch leave requests
        FormDAO fd = new FormDAO();
        List<LeaveForm> leaveRequests = fd.getApprovedLeaves(startDate, endDate);

        // Generate date range
        List<LocalDate> dates = new ArrayList<>();
        LocalDate date = startDate;
        while (!date.isAfter(endDate)) {
            dates.add(date);
            date = date.plusDays(1);
        }

        // Create agenda table
        Map<String, boolean[]> agenda = createAgendaTable(leaveRequests, startDate, endDate, user);

        // Set attributes for JSP
        req.setAttribute("dates", dates);
        req.setAttribute("agenda", agenda);
        req.getRequestDispatcher("../view/home/agenda.jsp").forward(req, resp);
    }
    
    private Map<String, boolean[]> createAgendaTable(List<LeaveForm> leaveRequests, 
                                                    LocalDate startDate, LocalDate endDate, User user) {
        Map<String, boolean[]> agenda = new HashMap<>();
        long totalDays = java.time.temporal.ChronoUnit.DAYS.between(startDate, endDate) + 1;

        // Initialize agenda for each employee with all false (working)
        /*for (LeaveForm request : leaveRequests) {
            String employeeName = request.getCreatedBy();
            agenda.putIfAbsent(employeeName, new boolean[(int) totalDays]);
        }*/

        ArrayList<Employee> emps = user.getEmployee().getStaffs();
        for(Employee emp : emps){
            String employeeName = emp.getName();
            agenda.putIfAbsent(employeeName, new boolean[(int) totalDays]);
        }
        // Mark leave days as true
        for (LeaveForm request : leaveRequests) {
            String employeeName = request.getCreatedBy();
            LocalDate from = LeaveForm.convertSqlDateToLocalDate(request.getFrom());
            LocalDate to = LeaveForm.convertSqlDateToLocalDate(request.getTo());
            
            if (to.isBefore(startDate) || from.isAfter(endDate)) {
                continue;
            }

            int startIndex = (int) java.time.temporal.ChronoUnit.DAYS.between(startDate, from);
            int endIndex = (int) java.time.temporal.ChronoUnit.DAYS.between(startDate, to);

            boolean[] schedule = agenda.get(employeeName);
            startIndex = Math.max(0, startIndex);
            endIndex = Math.min(endIndex, (int) totalDays - 1);
            /*for (int i = startIndex; i <= endIndex && i < totalDays; i++) {
                if (schedule != null) {
                    schedule[i] = true; // Mark as on leave
                }
            }*/
            if (schedule != null) {
                for (int i = startIndex; i <= endIndex && i < totalDays; i++) {
                    schedule[i] = true; // Mark as on leave
                }
            }
        }

        return agenda;
    }
}
