<%-- 
    Document   : list2
    Created on : Mar 2, 2025, 3:23:44 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="mytag" uri="/WEB-INF/tlds/mytag"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Leave Request Approvals</title>
        <mytag:urlResolver target="/css/approveList.css"/>
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
                                    <a href="approve2?from=${form.from}&to=${form.to}&reason=${form.reason}&createdBy=${form.createdBy}&status=1" class="approve-btn">Approve</a>
                                    <a href="approve2?from=${form.from}&to=${form.to}&reason=${form.reason}&createdBy=${form.createdBy}&status=0" class="reject-btn">Reject</a>
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