<!DOCTYPE html>
<html>
<head>
    <title>Delete User</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #f5f7fa, #c3cfe2);
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 50px 20px;
            min-height: 100vh;
            animation: fadeIn 0.6s ease-in;
        }

        .card {
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            max-width: 450px;
            width: 100%;
        }

        .card h2 {
            text-align: center;
            color: #dc3545;
            margin-bottom: 25px;
        }

        .form-label {
            font-weight: 500;
        }

        .btn-danger {
            width: 100%;
            transition: all 0.2s ease-in-out;
        }

        .btn-danger:hover {
            transform: scale(1.02);
        }

        .btn-group-links {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .btn-outline-secondary:hover {
            transform: scale(1.05);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

    <div class="card">
        <h2><i class="bi bi-trash3-fill"></i> Delete User</h2>
        <form action="DeleteUserServlet" method="post">
            <div class="mb-3">
                <label class="form-label">Username:</label>
                <input type="text" name="username" class="form-control" placeholder="Enter username to delete" required>
            </div>
            <button type="submit" class="btn btn-danger">
                <i class="bi bi-trash-fill"></i> Delete
            </button>
        </form>

        <div class="btn-group-links mt-4">
            <a href="dashboard.jsp" class="btn btn-outline-secondary">
                <i class="bi bi-speedometer2"></i> Dashboard
            </a>
            <a href="ShowUsers.jsp" class="btn btn-outline-secondary">
                <i class="bi bi-people-fill"></i> Show Users
            </a>
        </div>
    </div>

    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
