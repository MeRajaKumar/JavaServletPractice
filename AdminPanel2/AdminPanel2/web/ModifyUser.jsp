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
    <title>Modify User</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #f9f9f9, #e0e0e0);
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 50px 20px;
            min-height: 100vh;
            animation: fadeIn 0.8s ease-in;
        }

        .card {
            width: 100%;
            max-width: 550px;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            background: white;
        }

        .card h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #0d6efd;
        }

        .form-label {
            font-weight: 500;
        }

        .btn-primary {
            width: 100%;
            transition: all 0.2s ease;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
        }

        .btn-group-links {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .btn-outline-secondary {
            transition: transform 0.2s ease;
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
        <h2><i class="bi bi-pencil-square"></i> Modify User</h2>
        <form action="ModifyUserServlet" method="post">
            <div class="mb-3">
                <label class="form-label">Username to Modify:</label>
                <input type="text" name="username" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">New First Name:</label>
                <input type="text" name="fname" class="form-control">
            </div>

            <div class="mb-3">
                <label class="form-label">New Last Name:</label>
                <input type="text" name="lname" class="form-control">
            </div>

            <div class="mb-3">
                <label class="form-label">New Age:</label>
                <input type="number" name="age" class="form-control">
            </div>

            <div class="mb-3">
                <label class="form-label">New Gender:</label>
                <select name="gender" class="form-select">
                    <option value="">-- Select Gender --</option>
                    <option>Male</option>
                    <option>Female</option>
                    <option>Other</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary mt-2">
                <i class="bi bi-check-circle"></i> Modify
            </button>
        </form>

        <div class="btn-group-links mt-4">
            <a href="ShowUsers.jsp" class="btn btn-outline-secondary">
                <i class="bi bi-people-fill"></i> Show Users
            </a>
            <a href="dashboard.jsp" class="btn btn-outline-secondary">
                <i class="bi bi-speedometer2"></i> Dashboard
            </a>
        </div>
    </div>

    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
