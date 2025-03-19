<%-- 
    Document   : updateList
    Created on : Mar 18, 2025, 9:50:49 AM
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="mytag" uri="/WEB-INF/tlds/mytag"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Update Leave Requests</title>
        <mytag:urlResolver target="/css/updateList.css"/>
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