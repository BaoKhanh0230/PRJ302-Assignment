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
        <title>Leave Request Form</title>
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
            <form action="create" method="POST">
                <div class="form_group">
                    <label>Đơn xin nghỉ phép</label>
                </div>
                <div class="form_group">
                    <label>Username: ${sessionScope.user.employee.name}</label>
                </div>
                <div class="form_group">
                    <label>From:</label>
                    <input type="date" name="from"/>
                </div>
                <div class="form_group">
                    <label>To:</label>
                    <input type="date" name="to"/>
                </div>
                <div class="form_group">
                    <label>Reason</label>
                    <textarea name="reason" placeholder="Enter reason here..."></textarea>
                </div>
                <input type="submit" value="Create" />
            </form>
        </div>
    </body>
</html>
