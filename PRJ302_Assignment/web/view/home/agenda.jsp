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
    </style>
</head>
<body>
    <h1>Employee Leave Agenda (Mar 1, 2025 - Mar 9, 2025)</h1>
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
