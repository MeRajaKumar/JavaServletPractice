<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Success</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #d4fc79, #96e6a1);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .box {
            text-align: center;
            background: white;
            padding: 40px 60px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }

        h2 {
            color: #2ecc71;
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            text-decoration: none;
            background-color: #2ecc71;
            color: white;
            padding: 12px 25px;
            border-radius: 10px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s;
        }

        a:hover {
            background-color: #27ae60;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="box">
        <h2>✅ Operation Successful!</h2>
        <a href="index.jsp">🏠 Go to Home</a>
    </div>
</body>
</html>
