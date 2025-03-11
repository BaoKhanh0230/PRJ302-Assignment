<%-- 
    Document   : list2
    Created on : Mar 2, 2025, 3:23:44 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Leave Request Approvals</title>
        <style>
            /* Formal CSS Styling for Approval List Form */
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
                gap: 8px; /* Space between buttons */
            }
            .approve-btn, .reject-btn {
                display: inline-block;
                padding: 6px 12px;
                border-radius: 4px;
                text-decoration: none;
                font-size: 13px;
                font-weight: 500;
                text-align: center;
                transition: background-color 0.3s ease;
            }
            .approve-btn {
                background-color: #2e7d32; /* Green for approve */
                color: #fff;
            }
            .approve-btn:hover {
                background-color: #1b5e20; /* Darker green */
            }
            .reject-btn {
                background-color: #c62828; /* Red for reject */
                color: #fff;
            }
            .reject-btn:hover {
                background-color: #b71c1c; /* Darker red */
            }
            .back-btn {
                display: inline-block;
                background-color: #1565c0; /* Deep blue */
                color: #ffffff;
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
            <h1 class="page-title">Leave Request Approvals</h1>
            <c:choose>
                <c:when test="${listForm != null && not empty listForm}">
                    <h2 class="sub-title">There are ${listForm.size()} forms</h2>
                    <table class="form-table" border="1">
                        <tr>
                            <th>ID</th>
                            <th>Created By</th>
                            <th>Created Date</th>
                            <th>From</th>
                            <th>To</th>
                            <th>Reason</th>
                            <th>Approve</th>
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
                                    <a href="approve2?from=${form.from}&to=${form.to}&reason=${form.reason}&createdBy=${form.createdBy}" class="approve-btn">Approve</a>
                                    <a href="reject2?from=${form.from}&to=${form.to}&reason=${form.reason}&createdBy=${form.createdBy}" class="reject-btn">Reject</a>
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