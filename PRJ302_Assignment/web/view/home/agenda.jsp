<%-- 
    Document   : agenda
    Created on : Mar 6, 2025, 10:26:08 AM
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tlds/mytag"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Leave Agenda</title>
        <mytag:urlResolver target="/css/agenda.css"/>
    </head>
    <body>
        <div class="container">
            <h1 class="page-title">Employee Leave Agenda</h1>

            <!-- Form to select start and end dates using date pickers -->
            <div class="form-container">
                <form action="view" method="get">
                    <label for="start" class="form-label">Start Date:</label>
                    <input type="date" id="start" name="start" class="form-date" value="<%
                        java.time.LocalDate start = (java.time.LocalDate) request.getAttribute("startDate");
                        if (start != null) out.print(start);
                           %>">

                    <label for="end" class="form-label">End Date:</label>
                    <input type="date" id="end" name="end" class="form-date" value="<%
                        java.time.LocalDate end = (java.time.LocalDate) request.getAttribute("endDate");
                        if (end != null) out.print(end);
                           %>">

                    <input type="submit" value="Update Agenda" class="submit-btn">
                </form>
            </div>

            <!-- Display error message if any -->
            <%
                String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
            <p class="error-message"><%= error %></p>
            <%
                }
            %>

            <div class="table-wrapper">
                <table class="agenda-table">
                    <tr>
                        <th class="employee-column">Employee</th>
                            <%
                                java.util.List<java.time.LocalDate> dates = (java.util.List<java.time.LocalDate>) request.getAttribute("dates");
                                for (java.time.LocalDate date : dates) {
                            %>
                        <th><%= date.format(java.time.format.DateTimeFormatter.ofPattern("d/M")) %></th>
                            <%
                                }
                            %>
                    </tr>
                    <%
                        java.util.Map<String, boolean[]> agenda = (java.util.Map<String, boolean[]>) request.getAttribute("agenda");
                        for (java.util.Map.Entry<String, boolean[]> entry : agenda.entrySet()) {
                    %>
                    <tr>
                        <td class="employee-column"><%= entry.getKey() %></td>
                        <%
                            boolean[] schedule = entry.getValue();
                            for (boolean isOnLeave : schedule) {
                        %>
                        <td class="<%= isOnLeave ? "status-red" : "status-green" %>"></td>
                        <%
                            }
                        %>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
            <a href="../home">
                <input type="button" value="Back to Home" class="back-btn" />
            </a>
        </div>
    </body>
</html>