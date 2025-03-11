<%-- 
    Document   : welcome
    Created on : Feb 23, 2025, 11:35:03 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Dashboard</title>
        <link rel="stylesheet" href="styles2.css">
    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar -->
            <div class="sidebar">
                <h2>Menu</h2>
                <ul class="nav-links">
                    <li><a href="user/list"><span>View List</span></a></li>
                    <li><a href="user/create"><span>Create</span></a></li>
                    <li><a href="user/update"><span>Update</span></a></li>
                    <li><a href="user/approve"><span>Approve</span></a></li>
                    <li><a href="user/view"><span>Agenda Table</span></a></li>
                </ul>
            </div>

            <!-- Main Content -->
            <div class="main-content">
                <h1 class="greeting">Hello ${sessionScope.user.displayname}</h1>
                
                <div class="report-section">
                    <c:if test="${sessionScope.user.employee.manager ne null}">
                        <p class="manager-info">Report to: ${sessionScope.user.employee.manager.name}</p>
                    </c:if>
                    
                    <p class="staff-title">Report to you:</p>
                    <ul class="staff-list">
                        <c:forEach items="${sessionScope.user.employee.staffs}" var="s">
                            <li>${s.name}</li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>
