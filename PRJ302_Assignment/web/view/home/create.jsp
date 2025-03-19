<%-- 
    Document   : create
    Created on : Feb 25, 2025, 9:23:49 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tlds/mytag"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Leave Request Form</title>
        <mytag:urlResolver target="/css/create.css"/>
    </head>
    <body>
        <div class="form-container">
            <form action="create" method="POST">
                <div class="form-group">
                    <label class="form-title">Đơn xin nghỉ phép</label>
                </div>
                <div class="form-group">
                    <label class="form-label">Username: ${sessionScope.user.employee.name}</label>
                </div>
                <div class="form-group">
                    <label class="form-label">From:</label>
                    <input type="date" name="from" class="form-date"/>
                </div>
                <div class="form-group">
                    <label class="form-label">To:</label>
                    <input type="date" name="to" class="form-date"/>
                </div>
                <div class="form-group">
                    <label class="form-label">Reason</label>
                    <textarea name="reason" class="form-textarea" placeholder="Enter reason here..."></textarea>
                </div>
                <input type="submit" value="Create" class="submit-btn" />
            </form>
            <a href="../home">
                <input type="button" value="Back to Home" class="back-btn" />
            </a>
        </div>
    </body>
</html>