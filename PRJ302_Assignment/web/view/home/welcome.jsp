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
        <!-- Include Font Awesome for icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                font-family: 'Segoe UI', 'Arial', sans-serif;
                background-color: #f0f2f5;
                color: #2d3748;
                line-height: 1.6;
            }
            .wrapper {
                display: flex;
                min-height: 100vh;
            }
            .main-content {
                margin-left: 80px; /* Matches collapsed sidebar width */
                padding: 30px;
                flex-grow: 1;
                transition: margin-left 0.3s ease;
            }
            .sidebar:hover ~ .main-content {
                margin-left: 250px; /* Adjusts when sidebar expands */
            }
            .greeting {
                font-size: 26px;
                color: #2d3748;
                margin-bottom: 25px;
                font-weight: 600;
            }

            .report-section {
                background: #ffffff;
                padding: 25px;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
                max-width: 600px;
            }

            .manager-info {
                font-size: 15px;
                color: #718096;
                margin-bottom: 20px;
                padding: 10px;
                background: #edf2f7;
                border-radius: 6px;
            }

            .staff-title {
                font-size: 17px;
                font-weight: 600;
                margin-bottom: 15px;
                color: #2d3748;
            }

            .staff-list {
                list-style: none;
            }

            .staff-list li {
                padding: 10px 0;
                border-bottom: 1px solid #e2e8f0;
                font-size: 15px;
                color: #4a5568;
            }

            .staff-list li:last-child {
                border-bottom: none;
            }
            /* Sidebar Styles */
            .sidebar {
                width: 80px; /* Collapsed state */
                background-color: #2d3748 !important; /* Darker background */
                color: #ecf0f1; /* Light text/icons for contrast */
                padding: 20px 10px;
                position: fixed;
                height: 100%;
                box-shadow: 2px 0 10px rgba(0, 0, 0, 0.05);
                transition: width 0.3s ease;
                overflow: hidden;
            }
            .sidebar:hover {
                width: 250px; /* Expanded state on hover */
            }
            .sidebar.active {
                width: 250px;
                padding: 20px 10px;
            }

            .sidebar h2 {
                font-size: 20px;
                margin-bottom: 30px;
                text-align: center;
                color: #38a169;
                white-space: nowrap;
                display: none;
            }
            .sidebar:hover h2 {
                display: block; /* Show title when expanded */
            }
            .sidebar.active h2 {
                display: block;
            }

            .nav-links {
                list-style: none;
            }

            .nav-links li {
                margin: 20px 0;
            }

            .nav-links a {
                color: #ecf0f1;
                text-decoration: none;
                font-size: 16px;
                display: flex;
                align-items: center;
                justify-content: center; /* Center icons in collapsed state */
                padding: 10px;
                border-radius: 6px;
                transition: background 0.3s, color 0.3s;
                white-space: nowrap;
                overflow: hidden;
            }
            .nav-links a span {
                display: none; /* Hide text by default */
                transition: opacity 0.3s ease;
                margin-left: 10px; /* Space for potential icons */
            }
            .sidebar:hover .nav-links a span {
                display: inline; /* Show text on hover */
            }
            .nav-links a:hover {
                background-color: #e6fffa;
                color: #38a169;
            }
            .sidebar.active .nav-links a {
                justify-content: flex-start; /* Align to left when expanded */
            }

            .nav-links a span {
                display: none; /* Hide text by default */
                transition: opacity 0.3s ease;
                margin-left: 10px; /* Space between icon and text */
            }

            .sidebar.active .nav-links a span {
                display: inline;
            }

            .nav-links a:hover {
                background-color: #34495e;
                color: #38a169;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar -->
            <div class="sidebar">
                <h2>Menu</h2>
                <ul class="nav-links">
                    <li><a href="user/list"><i class="fas fa-list"></i><span>View List</span></a></li>
                    <li><a href="user/create"><i class="fas fa-plus"></i><span>Create</span></a></li>
                    <li><a href="user/update"><i class="fas fa-edit"></i><span>Update</span></a></li>
                    <li><a href="user/approve"><i class="fas fa-check"></i><span>Approve</span></a></li>
                    <li><a href="user/view"><i class="fas fa-table"></i><span>Agenda Table</span></a></li>
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