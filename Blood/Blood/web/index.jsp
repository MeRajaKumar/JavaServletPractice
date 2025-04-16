<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Blood Bank Management System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #ff6e7f, #bfe9ff);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: white;
            padding: 30px 50px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            text-align: center;
        }

        h1 {
            color: #c0392b;
            margin-bottom: 30px;
        }

        a {
            display: block;
            text-decoration: none;
            color: white;
            background-color: #e74c3c;
            padding: 12px 20px;
            margin: 10px 0;
            border-radius: 10px;
            transition: background-color 0.3s, transform 0.2s;
        }

        a:hover {
            background-color: #c0392b;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🩸 Welcome to Blood Bank</h1>
        <a href="register.jsp">Register Donor</a>
        <a href="search.jsp">Search Donor</a>
        <a href="request.jsp">Request Blood</a>
    </div>
</body>
</html>
