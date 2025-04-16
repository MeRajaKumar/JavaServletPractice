<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Request Blood</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #ffecd2, #fcb69f);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-box {
            background: white;
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            width: 380px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #d63031;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: 500;
            color: #2d3436;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 10px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        input[type="submit"] {
            margin-top: 25px;
            width: 100%;
            padding: 12px;
            background-color: #d63031;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s;
        }

        input[type="submit"]:hover {
            background-color: #b71c1c;
            transform: scale(1.02);
        }
    </style>
</head>
<body>
    <div class="form-box">
        <h2>🩸 Blood Request Form</h2>
        <form action="RequestServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" name="name" required>

            <label for="blood">Blood Group:</label>
            <input type="text" name="blood" required>

            <label for="contact">Contact:</label>
            <input type="text" name="contact" required>

            <input type="submit" value="Request Blood">
        </form>
    </div>
</body>
</html>
