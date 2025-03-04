<%-- 
    Document   : update
    Created on : Mar 4, 2025, 4:51:02 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* CSS styling to match the design */
            .form-container {
                width: 400px;
                margin: 20px auto;
                padding: 20px;
                background-color: #ffe4e1; /* Light peach background */
                border: 2px solid #ccc;
                border-radius: 5px;
            }
            .form-group {
                margin-bottom: 15px;
            }
            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }
            input[type="text"], input[type="date"] {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            textarea {
                width: 100%;
                height: 100px;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                resize: vertical;
            }
            .submit-btn {
                background-color: #007bff; /* Blue button */
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
            }
            .submit-btn:hover {
                background-color: #0056b3;
            }
        </style>
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
