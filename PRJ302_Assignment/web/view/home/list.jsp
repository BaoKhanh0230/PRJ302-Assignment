<%-- 
    Document   : list
    Created on : Feb 26, 2025, 8:01:38 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>List Form</h1>
        <c:choose>
            <c:when test="${listForm != null && not empty listForm}">
                <h2>There are ${listForm.size()} forms</h2>
                <table border="1">
                    <tr>
                        <th>Username</th>
                        <th>Role</th>
                        <th>Department</th>
                        <th>From Date</th>
                        <th>To Date</th>
                        <th>Reason</th>
                    </tr>
                    <c:forEach var="form" items="${listForm}">
                        <tr>
                            <td>${form.user}</td>
                            <td>${form.role}</td>
                            <td>${form.department}</td>
                            <td><fmt:formatDate value="${form.fromDay}" pattern="yyyy-MM-dd"/></td>
                            <td><fmt:formatDate value="${form.toDay}" pattern="yyyy-MM-dd"/></td>
                            <td>${form.reason}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <h2>There are 0 forms</h2>
                <p>No forms found.</p>
            </c:otherwise>
        </c:choose>
    </body>
</html>
