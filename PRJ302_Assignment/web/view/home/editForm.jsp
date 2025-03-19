<%-- 
    Document   : editForm
    Created on : Mar 18, 2025, 10:15:11 AM
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="mytag" uri="/WEB-INF/tlds/mytag"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Form</title>
        <mytag:urlResolver target="/css/editForm.css"/>
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