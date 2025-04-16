<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Logged Out</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #e0eafc, #cfdef3);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: 'Segoe UI', sans-serif;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        .logout-box {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            animation: fadeIn 0.8s ease;
        }

        .logout-box h2 {
            color: #28a745;
            margin-bottom: 20px;
        }

        .logout-box i {
            font-size: 40px;
            color: #28a745;
            margin-bottom: 15px;
        }

        .login-again-btn {
            margin-top: 15px;
            transition: all 0.3s ease;
        }

        .login-again-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
        }
    </style>
</head>
<body>

    <div class="logout-box">
        <i class="bi bi-check-circle-fill"></i>
        <h2>You have been successfully logged out.</h2>
        <a href="index.jsp" class="btn btn-success login-again-btn">Login Again</a>
    </div>

    <!-- Bootstrap JS (Optional for interactions) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 