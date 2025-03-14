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
            /* Formal CSS Styling */
            .form-container {
                width: 450px;
                margin: 40px auto;
                padding: 25px;
                background-color: #f5f6f5; /* Subtle off-white */
                border: 1px solid #dcdcdc;
                border-radius: 6px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            }
            .form-title {
                font-size: 20px;
                font-weight: 600;
                color: #2b2b2b;
                margin-bottom: 20px;
                text-align: center;
                font-family: 'Helvetica', sans-serif;
            }
            .form-group {
                margin-bottom: 20px;
            }
            .form-label {
                display: block;
                margin-bottom: 6px;
                font-weight: 500;
                color: #444;
                font-family: 'Helvetica', sans-serif;
            }
            .form-input, .form-date {
                width: 100%;
                padding: 10px;
                border: 1px solid #c0c0c0;
                border-radius: 4px;
                box-sizing: border-box;
                font-size: 14px;
                background-color: #fff;
                color: #333;
                font-family: 'Helvetica', sans-serif;
            }
            .form-input:focus, .form-date:focus {
                border-color: #1e88e5;
                outline: none;
                box-shadow: 0 0 3px rgba(30, 136, 229, 0.3);
            }
            .form-textarea {
                width: 100%;
                height: 120px;
                padding: 10px;
                border: 1px solid #c0c0c0;
                border-radius: 4px;
                box-sizing: border-box;
                font-size: 14px;
                font-family: 'Helvetica', sans-serif;
                background-color: #fff;
                color: #333;
                resize: vertical;
            }
            .form-textarea:focus {
                border-color: #1e88e5;
                outline: none;
                box-shadow: 0 0 3px rgba(30, 136, 229, 0.3);
            }
            .submit-btn {
                background-color: #1565c0; /* Deep blue */
                color: #ffffff;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
                font-size: 15px;
                font-weight: 500;
                font-family: 'Helvetica', sans-serif;
                transition: background-color 0.3s ease;
            }
            .submit-btn:hover {
                background-color: #0d47a1; /* Darker blue */
            }
            .back-btn {
                margin-top: 10px;
                display: inline-block;
                background-color: #1565c0;
                color: #ffffff;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 14px;
                font-weight: 500;
                text-decoration: none;
                transition: background-color 0.3s ease;
            }
            .back-btn:hover {
                background-color: #0d47a1;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <form action="create" method="POST">
                <div class="form-group">
                    <label class="form-title">Đơn xin nghỉ phép</label>
                </div>
                <div class="form-group">
                    <label class="form-label">Username: ${sessionScope.user.employee.name}</label>
                </div>
                <div class="form-group">
                    <label class="form-label">From:</label>
                    <input type="date" name="from" class="form-date"/>
                </div>
                <div class="form-group">
                    <label class="form-label">To:</label>
                    <input type="date" name="to" class="form-date"/>
                </div>
                <div class="form-group">
                    <label class="form-label">Reason</label>
                    <textarea name="reason" class="form-textarea" placeholder="Enter reason here..."></textarea>
                </div>
                <input type="submit" value="Create" class="submit-btn" />
            </form>
            <a href="../home">
                <input type="button" value="Back to Home" class="back-btn" />
            </a>
        </div>
    </body>
</html>