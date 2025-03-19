<%-- 
    Document   : update
    Created on : Mar 4, 2025, 4:51:02 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tlds/mytag"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <mytag:urlResolver target="/css/update.css"/>
    </head>
    <body>
        <div class ="form-container">
            <form action="update" method="POST">
                <input type="hidden" name="id" value="${requestScope.model.id}" />
                Title:<input type="text" value="${requestScope.model.title}" name="title"/> <br/>
                Reason:<input type="text" value="${requestScope.model.reason}" name="reason"/> <br/>
                From:<input type="date" value="${requestScope.model.from}" name="from"/> <br/>
                To: <input type="date" value="${requestScope.model.to}" name="to"/> <br/>
                Owner: <select name="eid">
                    <c:forEach items="${requestScope.employees}" var="e">
                        <option 
                            <c:if test="${e.id eq requestScope.model.owner.id}">selected="selected"</c:if>
                            value="${e.id}">${e.name}</option>
                    </c:forEach>
                </select><br/>
                <input type="submit" value="Save"/>
            </form>
        </div>
    </body>
</html>
