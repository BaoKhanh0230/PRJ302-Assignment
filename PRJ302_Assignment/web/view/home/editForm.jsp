<%-- 
    Document   : editForm
    Created on : Mar 18, 2025, 10:15:11 AM
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Form</title>
        <style>
            .form-container {
                width: 450px;
                margin: 40px auto;
                padding: 25px;
                background-color: #f5f6f5; /* Subtle off-white */
                border: 1px solid #dcdcdc;
                border-radius: 6px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            }
            .form-group {
                margin-bottom: 20px;
            }
            .form-label {
                display: block;
                margin-bottom: 6px;
                font-weight: 500;
                color: #444;
                font-family: 'Helvetica', sans-serif;
            }
            input[type="text"], input[type="date"] {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;width: 100%;
                padding: 10px;
                border: 1px solid #c0c0c0;
                border-radius: 4px;
                box-sizing: border-box;
                font-size: 14px;
                background-color: #fff;
                color: #333;
                font-family: 'Helvetica', sans-serif;
            }
            .form-textarea {
                width: 100%;
                height: 120px;
                padding: 10px;
                border: 1px solid #c0c0c0;
                border-radius: 4px;
                box-sizing: border-box;
                font-size: 14px;
                font-family: 'Helvetica', sans-serif;
                background-color: #fff;
                color: #333;
                resize: vertical;
            }
            .form-textarea:focus {
                border-color: #1e88e5;
                outline: none;
                box-shadow: 0 0 3px rgba(30, 136, 229, 0.3);
            }
            .save-btn {
                background-color: #1565c0; /* Deep blue */
                color: #ffffff;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
                font-size: 15px;
                font-weight: 500;
                font-family: 'Helvetica', sans-serif;
                transition: background-color 0.3s ease;
            }
            .save-btn:hover {
                background-color: #0d47a1;
            }
            .back-btn {
                margin-top: 10px;
                display: inline-block;
                background-color: #1565c0;
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
                background-color: #0d47a1;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <h2>Edit Leave Request</h2>
            <form action="update2" method="post">
                <input type="hidden" name="id" value="${form.id}">
                <div class="form-group">
                    <label class="form-label">Username: ${sessionScope.user.employee.name}</label>
                </div>
                <div class="form-group">
                    <label class="form-label">From Date:</label>
                    <input type="date" id="fromDate" name="fromDate" value="<fmt:formatDate value='${form.from}' pattern='yyyy-MM-dd'/>" required>
                </div>
                <div class="form-group">
                    <label class="form-label">To Date:</label>
                    <input type="date" id="toDate" name="toDate" value="<fmt:formatDate value='${form.to}' pattern='yyyy-MM-dd'/>" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Reason:</label>
                    <textarea id="reason" name="reason" required>${form.reason}</textarea>
                </div>
                <div class="form-group">
                    <button type="submit" class="save-btn">Save</button>
                </div>
            </form>
            <a href="../home">
                <input type="button" value="Back to Home" class="back-btn" />
            </a>
        </div>
    </body>
</html>