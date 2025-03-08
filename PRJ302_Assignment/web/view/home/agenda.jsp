<%-- 
    Document   : agenda
    Created on : Mar 6, 2025, 10:26:08 AM
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Leave Agenda</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }
        .green {
            background-color: #00FF00;
        }
        .red {
            background-color: #FF0000;
        }
        .error {
            color: red;
            margin-bottom: 10px;
        }
        .form-container {
            margin-bottom: 20px;
        }
        .form-container label {
            margin-right: 10px;
        }
        .form-container input[type="date"] {
            margin-right: 20px;
        }
    </style>
</head>
<body>
    <h1>Employee Leave Agenda</h1>
    
    <!-- Form to select start and end dates using date pickers -->
    <div class="form-container">
        <form action="view" method="get">
            <label for="start">Start Date:</label>
            <input type="date" id="start" name="start" value="<%
                java.time.LocalDate start = (java.time.LocalDate) request.getAttribute("startDate");
                if (start != null) out.print(start);
            %>">
            
            <label for="end">End Date:</label>
            <input type="date" id="end" name="end" value="<%
                java.time.LocalDate end = (java.time.LocalDate) request.getAttribute("endDate");
                if (end != null) out.print(end);
            %>">
            
            <input type="submit" value="Update Agenda">
        </form>
    </div>

    <!-- Display error message if any -->
    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <p class="error"><%= error %></p>
    <%
        }
    %>

    <table>
        <tr>
            <th>Employee</th>
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
                <td><%= entry.getKey() %></td>
                <%
                    boolean[] schedule = entry.getValue();
                    for (boolean isOnLeave : schedule) {
                %>
                    <td class="<%= isOnLeave ? "red" : "green" %>"></td>
                <%
                    }
                %>
            </tr>
        <%
            }
        %>
    </table>
</body>
</html>