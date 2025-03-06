package com.example.leaveagenda.servlet;

import com.example.leaveagenda.model.LeaveRequest;
import com.example.leaveagenda.util.DatabaseUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class NewClass extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        LocalDate startDate = LocalDate.of(2025, 1, 1); // Adjust as needed
        LocalDate endDate = LocalDate.of(2025, 9, 1);   // Adjust as needed

        // Fetch leave requests
        List<LeaveRequest> leaveRequests = DatabaseUtil.getApprovedLeaves(startDate, endDate);

        // Generate date range
        List<LocalDate> dates = new ArrayList<>();
        LocalDate date = startDate;
        while (!date.isAfter(endDate)) {
            dates.add(date);
            date = date.plusDays(1);
        }

        // Create agenda table
        Map<String, boolean[]> agenda = createAgendaTable(leaveRequests, startDate, endDate);

        // Set attributes for JSP
        request.setAttribute("dates", dates);
        request.setAttribute("agenda", agenda);
        request.getRequestDispatcher("/agenda.jsp").forward(request, response);
    }

    private Map<String, boolean[]> createAgendaTable(List<LeaveRequest> leaveRequests, 
                                                    LocalDate startDate, LocalDate endDate) {
        Map<String, boolean[]> agenda = new HashMap<>();
        long totalDays = java.time.temporal.ChronoUnit.DAYS.between(startDate, endDate) + 1;

        // Initialize agenda for each employee with all false (working)
        for (LeaveRequest request : leaveRequests) {
            String employeeName = request.getEmployeeName();
            agenda.putIfAbsent(employeeName, new boolean[(int) totalDays]);
        }

        // Mark leave days as true
        for (LeaveRequest request : leaveRequests) {
            String employeeName = request.getEmployeeName();
            LocalDate from = request.getFromDate();
            LocalDate to = request.getToDate();

            int startIndex = (int) java.time.temporal.ChronoUnit.DAYS.between(startDate, from);
            int endIndex = (int) java.time.temporal.ChronoUnit.DAYS.between(startDate, to);

            boolean[] schedule = agenda.get(employeeName);
            for (int i = startIndex; i <= endIndex && i < totalDays; i++) {
                if (schedule != null) {
                    schedule[i] = true; // Mark as on leave
                }
            }
        }

        return agenda;
    }
}