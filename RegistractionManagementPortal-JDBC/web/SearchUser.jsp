<!DOCTYPE html>
<html>
<head>
    <title>Search User</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #f2f6fa, #dbe9f4);
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            animation: fadeIn 0.7s ease-in;
        }

        .search-container {
            background-color: white;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }

        h2 {
            color: #007bff;
            margin-bottom: 25px;
        }

        .form-control {
            margin-bottom: 15px;
        }

        .btn-primary {
            width: 100%;
            font-weight: 500;
            transition: all 0.3s ease-in-out;
        }

        .btn-primary:hover {
            transform: scale(1.03);
        }

        .dashboard-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
        }

        .btn-dashboard {
            background-color: #28a745;
            color: white;
            padding: 8px 20px;
            border-radius: 5px;
            font-weight: bold;
            transition: all 0.3s ease-in-out;
        }

        .btn-dashboard:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>

    <div class="search-container">
        <h2><i class="bi bi-search"></i> Search User</h2>
        <form action="SearchUserServlet" method="get">
            <input type="text" name="username" class="form-control" placeholder="Enter username" required>
            <button type="submit" class="btn btn-primary">
                <i class="bi bi-search"></i> Search
            </button>
        </form>

        <a href="dashboard.jsp" class="dashboard-link">
            <div class="btn-dashboard">
                <i class="bi bi-speedometer2"></i> Go to Dashboard
            </div>
        </a>
    </div>

    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
