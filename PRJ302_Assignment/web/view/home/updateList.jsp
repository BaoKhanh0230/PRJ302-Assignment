<%-- 
    Document   : updateList
    Created on : Mar 18, 2025, 9:50:49 AM
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Update Leave Requests</title>
        <style>
            /* Formal CSS Styling for Update Form List */
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
            .sub-title {
                font-size: 18px;
                font-weight: 500;
                color: #444;
                margin-bottom: 15px;
                text-align: center;
            }
            .form-table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            .form-table th {
                background-color: #1565c0; /* Deep blue header */
                color: #fff;
                padding: 12px;
                text-align: left;
                font-weight: 500;
                font-size: 14px;
                border: 1px solid #0d47a1;
            }
            .form-table td {
                padding: 10px;
                border: 1px solid #dcdcdc;
                font-size: 14px;
                vertical-align: middle;
            }
            .form-table tr:nth-child(even) {
                background-color: #f9f9f9; /* Light gray for alternating rows */
            }
            .form-table tr:hover {
                background-color: #eceff1; /* Subtle hover effect */
            }
            .no-data {
                font-size: 16px;
                color: #666;
                text-align: center;
                margin: 20px 0;
            }
            .button-group {
                display: flex;
                flex-direction: column;
                gap: 8px; /* Space between buttons if more are added later */
            }
            .update-btn {
                display: inline-block;
                padding: 6px 12px;
                border-radius: 4px;
                text-decoration: none;
                font-size: 13px;
                font-weight: 500;
                text-align: center;
                background-color: #1565c0; /* Deep blue for Update */
                color: #fff;
                transition: background-color 0.3s ease;
            }
            .update-btn:hover {
                background-color: #0d47a1; /* Darker blue on hover */
            }
            .back-btn {
                display: inline-block;
                background-color: #1565c0; /* Deep blue */
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 14px;
                font-weight: 500;
                text-decoration: none;
                transition: background-color 0.3s ease;
            }
            .back-btn:hover {
                background-color: #0d47a1; /* Darker blue */
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1 class="page-title">Update Leave Requests</h1>
            <c:choose>
                <c:when test="${listForm != null && not empty listForm}">
                    <h2 class="sub-title">There are ${listForm.size()} forms</h2>
                    <table class="form-table">
                        <tr>
                            <th>ID</th>
                            <th>Created By</th>
                            <th>Created Date</th>
                            <th>From</th>
                            <th>To</th>
                            <th>Reason</th>
                            <th>Action</th>
                        </tr>
                        <c:forEach var="form" items="${listForm}">
                            <tr>
                                <td>${form.id}</td>
                                <td>${form.createdBy}</td>
                                <td>${form.createdDate}</td>
                                <td><fmt:formatDate value="${form.from}" pattern="yyyy-MM-dd"/></td>
                                <td><fmt:formatDate value="${form.to}" pattern="yyyy-MM-dd"/></td>
                                <td>${form.reason}</td>
                                <td class="button-group">
                                    <a href="update2?id=${form.id}" class="update-btn">Update</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:when>
                <c:otherwise>
                    <h2 class="sub-title">There are 0 forms</h2>
                    <p class="no-data">No forms found.</p>
                </c:otherwise>
            </c:choose>
            <a href="../home">
                <input type="button" value="Back to Home" class="back-btn" />
            </a>
        </div>
    </body>
</html>