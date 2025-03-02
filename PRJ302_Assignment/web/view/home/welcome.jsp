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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello ${sessionScope.user.employee.name}</h1>
        
        <c:if test="${sessionScope.user.employee.manager ne null}">
            Report to ${sessionScope.user.employee.manager.name} <br/>
        </c:if>
        Report to you: <br/>
        <c:forEach items="${sessionScope.user.employee.staffs}" var="s">
            ${s.name} <br/>
        </c:forEach>
        
        <div>
            <a href="user/list">View List</a>
            <a href="user/create">Create</a>
            <a href="user/update">Update</a>
            <a href="user/approve">Approve</a>
            <a href="user/view">Agenda Table</a>
        </div>
    </body>
</html>
