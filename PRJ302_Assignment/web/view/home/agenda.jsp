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
        /* Formal CSS Styling for Leave Agenda with Scrollable Table */
        body {
            font-family: 'Helvetica', sans-serif;
            background-color: #f5f6f5; /* Off-white background */
            color: #333;
        }
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 40px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #dcdcdc;
            border-radius: 6px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }
        .page-title {
            font-size: 24px;
            font-weight: 600;
            color: #2b2b2b;
            margin-bottom: 20px;
            text-align: center;
        }
        .form-container {
            margin-bottom: 25px;
            display: flex;
            align-items: center;
            gap: 15px;
            justify-content: center; /* Center the form */
        }
        .form-label {
            font-weight: 500;
            color: #444;
            font-size: 14px;
        }
        .form-date {
            padding: 8px;
            border: 1px solid #c0c0c0;
            border-radius: 4px;
            font-size: 14px;
            font-family: 'Helvetica', sans-serif;
            background-color: #fff;
            color: #333;
        }
        .form-date:focus {
            border-color: #1e88e5;
            outline: none;
            box-shadow: 0 0 3px rgba(30, 136, 229, 0.3);
        }
        .submit-btn {
            background-color: #1565c0; /* Deep blue */
            color: #fff;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            transition: background-color 0.3s ease;
        }
        .submit-btn:hover {
            background-color: #0d47a1; /* Darker blue */
        }
        .error-message {
            color: #c62828; /* Red for errors */
            font-size: 14px;
            margin-bottom: 20px;
            text-align: center;
        }
        .table-wrapper {
            overflow-x: auto; /* Enable horizontal scrolling */
            margin-bottom: 20px;
            -webkit-overflow-scrolling: touch; /* Smooth scrolling on touch devices */
        }
        .agenda-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 600px; /* Ensure table doesn't shrink too much */
        }
        .agenda-table th {
            background-color: #1565c0; /* Deep blue header */
            color: #fff;
            padding: 10px;
            font-weight: 500;
            font-size: 14px;
            border: 1px solid #0d47a1;
            text-align: center;
            white-space: nowrap; /* Prevent header text wrapping */
        }
        .agenda-table td {
            padding: 8px;
            border: 1px solid #dcdcdc;
            text-align: center;
            font-size: 13px;
        }
        .status-green {
            background-color: #2e7d32; /* Green for available */
        }
        .status-red {
            background-color: #c62828; /* Red for on leave */
        }
        .employee-column {
            font-weight: 500;
            background-color: #f9f9f9; /* Light gray for employee names */
            text-align: left;
            padding-left: 12px;
            position: sticky; /* Keep employee column fixed */
            left: 0; /* Stick to the left edge */
            z-index: 1; /* Ensure it stays above scrolling content */
            min-width: 150px; /* Minimum width for employee names */
        }
    </style>
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
    </div>
</body>
</html>