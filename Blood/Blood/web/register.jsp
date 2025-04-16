<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register Donor</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #fbc2eb, #a6c1ee);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background: white;
            padding: 40px 60px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-top: 15px;
            color: #34495e;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            margin-top: 25px;
            width: 100%;
            padding: 12px;
            background-color: #e74c3c;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }

        input[type="submit"]:hover {
            background-color: #c0392b;
            transform: scale(1.03);
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>📝 Donor Registration</h2>
        <form action="RegisterServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" name="name" required>

            <label for="age">Age:</label>
            <input type="number" name="age" required>

            <label for="blood">Blood Group:</label>
            <input type="text" name="blood" required>

            <label for="contact">Contact:</label>
            <input type="text" name="contact" required>

            <label for="city">City:</label>
            <input type="text" name="city" required>

            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>
