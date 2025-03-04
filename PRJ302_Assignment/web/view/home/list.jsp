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
                        <th>ID</th>
                        <th>Created By</th>
                        <th>Created Date</th>
                        <th>From</th>
                        <th>To</th>
                        <th>Reason</th>
                        <th>Status</th>
                        <th>Processed By</th>
                    </tr>
                    <c:forEach var="form" items="${listForm}">
                        <tr>
                            <td>${form.id}</td>
                            <td>${form.createdBy}</td>
                            <td>${form.createdDate}</td>
                            <td><fmt:formatDate value="${form.from}" pattern="yyyy-MM-dd"/></td>
                            <td><fmt:formatDate value="${form.to}" pattern="yyyy-MM-dd"/></td>
                            <td>${form.reason}</td>
                            <td>${form.status}</td>
                            <td>${form.processedBy}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <h2>There are 0 forms</h2>
                <p>No forms found.</p>
            </c:otherwise>
        </c:choose>
        <a href="../home">
            <input type="button" value="Back to Home" />
        </a>
    </body>
</html>
