<%-- 
    Document   : approve
    Created on : Feb 26, 2025, 11:08:12 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Leave Request Form</title>
        <style>
            .form-container {
                width: 400px;
                margin: 20px auto;
                padding: 20px;
                background-color: #f0f0f0; /* Light gray background */
                border: 2px solid #ccc;
                border-radius: 5px;
                font-family: Arial, sans-serif;
            }
            .form-group {
                margin-bottom: 15px;
            }
            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }
            .readonly-text {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                background-color: #fff;
                box-sizing: border-box;
                resize: none;
                overflow: hidden;
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
            .button-group {
                margin-top: 20px;
                text-align: center;
            }
            .button-group button {
                padding: 10px 20px;
                margin: 0 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 14px;
            }
            .approve-btn {
                background-color: #28a745; /* Green for Approve */
                color: white;
            }
            .reject-btn {
                background-color: #dc3545; /* Red for Reject */
                color: white;
            }
            .approve-btn:hover {
                background-color: #218838;
            }
            .reject-btn:hover {
                background-color: #c82333;
            }
        </style>
    </head>
    <body>
        <div class ="form-container">
            <form action="create" method="POST">
                <div class="form_group">
                    <label>Duyệt đơn xin nghỉ phép</label>
                </div>
                <div class="form_group">
                    <label>Username: ${sessionScope.user.username}</label>
                </div>
                <div class="form_group">
                    <label>Role</label>
                    <select name="role">
                        <option value="Staff">Staff</option>
                        <option value="TeamLeader">Team Leader</option>
                        <option value="DivisionLeader">Division Leader</option>
                    </select>
                </div>
                <div class="form_group">
                    <label>Department</label>
                    <select name="department">
                        <option value="IT">IT</option>
                        <option value="QA">QA</option>
                        <option value="Sale">Sale</option>
                    </select>
                </div>
                <div class="form_group">
                    <label>From day</label>
                    <input type="date" name="fromDate"/>
                </div>
                <div class="form_group">
                    <label>To day</label>
                    <input type="date" name="toDate"/>
                </div>
                <div class="form_group">
                    <label>Reason</label>
                    <textarea name="reason" placeholder="Enter reason here..."></textarea>
                </div>
                <input type="submit" value="Approve" />
                <input type="submit" value="Reject" />
            </form>
        </div>
    </body>
</html>
