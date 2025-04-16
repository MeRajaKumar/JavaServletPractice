<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>
<%
    String user = (session != null) ? (String) session.getAttribute("adminUser") : null;
    if (user == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Register User</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #fdfbfb, #ebedee);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            font-family: 'Segoe UI', sans-serif;
            animation: fadeIn 1s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .card {
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease;
            width: 100%;
            max-width: 500px;
        }

        .card h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #007bff;
        }

        .form-control:focus {
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
        }

        .btn-primary {
            width: 100%;
            transition: transform 0.2s ease;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
        }

        .dashboard-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #6c757d;
            transition: color 0.3s;
        }

        .dashboard-link:hover {
            color: #007bff;
            text-decoration: none;
        }
    </style>
</head>
<body>

    <div class="card">
        <h2><i class="bi bi-person-plus-fill"></i> Register New User</h2>
        <form action="RegisterUserServlet" method="post">
            <div class="mb-3">
                <input type="text" name="firstName" class="form-control" placeholder="First Name" required>
            </div>
            <div class="mb-3">
                <input type="text" name="lastName" class="form-control" placeholder="Last Name" required>
            </div>
            <div class="mb-3">
                <input type="number" name="age" class="form-control" placeholder="Age" required>
            </div>
            <div class="mb-3">
                <select name="gender" class="form-select" required>
                    <option value="">Select Gender</option>
                    <option>Male</option>
                    <option>Female</option>
                    <option>Other</option>
                </select>
            </div>
            <div class="mb-3">
                <input type="text" name="username" class="form-control" placeholder="Username" required>
            </div>
            <div class="mb-3">
                <input type="password" name="password" class="form-control" placeholder="Password" required>
            </div>
            <button type="submit" class="btn btn-primary">Register</button>
        </form>

        <a href="dashboard.jsp" class="dashboard-link"><i class="bi bi-arrow-left-circle"></i> Back to Dashboard</a>
    </div>

    <!-- Bootstrap JS (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
