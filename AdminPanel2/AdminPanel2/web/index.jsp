<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #74ebd5, #9face6);
            font-family: 'Segoe UI', sans-serif;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            animation: fadeIn 0.6s ease-in;
        }

        .login-container {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            animation: slideUp 0.8s ease;
        }

        .login-container h2 {
            margin-bottom: 25px;
            color: #333333;
            font-weight: 600;
        }

        .form-control {
            border-radius: 8px;
            font-size: 15px;
        }

        .btn-login {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 10px;
            width: 100%;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .btn-login:hover {
            background-color: #45a049;
            transform: scale(1.03);
        }

        .form-icon {
            font-size: 50px;
            color: #4CAF50;
            margin-bottom: 15px;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideUp {
            from { transform: translateY(20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
    </style>
</head>
<body>

<div class="login-container shadow">
    <div class="text-center">
        <i class="bi bi-person-circle form-icon"></i>
        <h2>Admin Login</h2>
    </div>
    <form action="LoginServlet" method="post">
        <div class="mb-3">
            <input type="text" class="form-control" name="username" placeholder="Username" required>
        </div>
        <div class="mb-3">
            <input type="password" class="form-control" name="password" placeholder="Password" required>
        </div>
        <input type="submit" class="btn-login" value="Login">
    </form>
</div>

<!-- Bootstrap Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
