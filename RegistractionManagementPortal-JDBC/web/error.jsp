<!DOCTYPE html>
<html>
<head>
    <title>Login Failed</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #f8d7da, #ffffff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: 'Segoe UI', sans-serif;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }

        .error-box {
            background-color: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
        }

        .error-box h3 {
            color: #dc3545;
            margin-bottom: 20px;
        }

        .retry-btn {
            margin-top: 15px;
            transition: all 0.3s ease-in-out;
        }

        .retry-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>

    <div class="error-box">
        <h3><i class="bi bi-exclamation-triangle-fill"></i> Login Failed!</h3>
        <p class="text-muted">Invalid username or password.</p>
        <a href="index.jsp" class="btn btn-danger retry-btn">Try Again</a>
    </div>

    <!-- Bootstrap JS + Icons (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</body>
</html>
