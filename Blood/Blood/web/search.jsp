<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Search Donor</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #74ebd5, #acb6e5);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-box {
            background: white;
            padding: 35px 45px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            width: 350px;
        }

        h2 {
            text-align: center;
            color: #2e86de;
            margin-bottom: 20px;
        }

        label {
            font-weight: 500;
            display: block;
            margin-bottom: 8px;
            color: #2d3436;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border-radius: 10px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        input[type="submit"] {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background-color: #2e86de;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s;
        }

        input[type="submit"]:hover {
            background-color: #1e5fba;
            transform: scale(1.03);
        }
    </style>
</head>
<body>
    <div class="form-box">
        <h2>🔍 Search Blood Group</h2>
        <form action="SearchServlet" method="post">
            <label for="blood">Enter Blood Group:</label>
            <input type="text" name="blood" required>

            <input type="submit" value="Search">
        </form>
    </div>
</body>
</html>
