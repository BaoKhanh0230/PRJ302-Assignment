<%-- 
    Document   : welcome
    Created on : Feb 23, 2025, 11:35:03 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello ${sessionScope.user.displayname}</h1>
        <div>
            <a href="user/list">View List</a>
            <a href="user/create">Create</a>
            <a href="user/update">Update</a>
            <a href="user/approve">Approve</a>
            <a href="user/view">Agenda Table</a>
        </div>
    </body>
</html>
