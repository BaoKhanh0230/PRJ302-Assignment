<%-- 
    Document   : create
    Created on : Feb 25, 2025, 9:23:49 AM
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
        <h1>Đơn xin nghỉ phép</h1>
        <h5 style="color: red">${error}</h5>
        <form action="create" method="POST">
            <table border="1">
                <tbody>
                     <tr>
                        <td>Username</td>
                        <td>
                            <input type="text" name="username" value="" />
                        </td>
                    </tr>
                    <tr>
                        <td>Role</td>
                        <td>
                            <select name="role">
                                <option value="Staff">Staff</option>
                                <option value="TeamLeader">Team Leader</option>
                                <option value="DivisionLeader">Division Leader</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Department</td>
                        <td>
                            <select name="dep">
                                <option value="IT">IT</option>
                                <option value="QA">QA</option>
                                <option value="Sale">Sale</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>From day</td>
                        <td> <input type="date" name="fromDate"/></td>
                    </tr>
                    <tr>
                        <td>To day</td>
                        <td>
                             <input type="date" name="toDate"/>
                        </td>
                    </tr>
                   
                    <tr>
                        <td>
                            <input type="submit" value="Add" />
                        </td>
                        <td>
                            <a href="ReListJob">
                                <input type="button" value="Return to Job List" />
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table>

        </form>
    </body>
</html>
