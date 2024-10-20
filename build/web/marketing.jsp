<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .navbar {
            margin-bottom: 20px;
        }
        .navbar a {
            margin-right: 15px;
            text-decoration: none;
            color: #007BFF;
        }
        .navbar a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Welcome to the marketing Page!</h1>
    
    <div class="navbar">
        <a href="feedbacksList">Feedbacks List</a>
       
        <a href="customerlist">Customer List</a>
        <a href="dash">Dashboard</a>
        <a href="proformarketing">Product List</a>
    </div>
    
    <p>Select an option above to manage the application.</p>
</body>
</html>
