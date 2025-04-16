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
    <title>Admin Dashboard</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #e0f7fa, #ede7f6);
            font-family: 'Segoe UI', sans-serif;
            height: 100vh;
            animation: fadeInBody 1s ease-in;
        }

        @keyframes fadeInBody {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .dashboard-container {
            margin-top: 80px;
            background-color: #ffffff;
            padding: 50px 30px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            animation: slideUp 0.8s ease;
        }

        @keyframes slideUp {
            from { transform: translateY(40px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .dashboard-title {
            font-size: 30px;
            font-weight: bold;
            color: #0d6efd;
        }

        .action-link {
            margin: 12px;
            display: inline-block;
            animation: fadeLink 0.9s ease;
        }

        @keyframes fadeLink {
            from { transform: scale(0.9); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }

        .btn-dashboard {
            padding: 14px 22px;
            font-size: 16px;
            font-weight: 500;
            border-radius: 12px;
            transition: all 0.3s ease;
        }

        .btn-dashboard i {
            margin-right: 8px;
        }

        .btn-dashboard:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 15px rgba(0,0,0,0.1);
        }

        .logout-btn {
            margin-top: 30px;
        }

        .logout-btn a:hover {
            transform: scale(1.05);
        }

        @media (max-width: 768px) {
            .btn-dashboard {
                width: 100%;
                margin: 10px 0;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="dashboard-container text-center">
        <div class="dashboard-title"><i class="bi bi-speedometer2"></i> Welcome, <%= user %>!</div>
        <p class="text-muted mt-2">Manage your application users below</p>

        <div class="mt-4">
            <div class="action-link">
                <a href="RegisterUser.jsp" class="btn btn-primary btn-dashboard">
                    <i class="bi bi-person-plus-fill"></i> Register New User
                </a>
            </div>
            <div class="action-link">
                <a href="ModifyUser.jsp" class="btn btn-warning btn-dashboard text-dark">
                    <i class="bi bi-pencil-square"></i> Modify User
                </a>
            </div>
            <div class="action-link">
                <a href="DeleteUser.jsp" class="btn btn-danger btn-dashboard">
                    <i class="bi bi-trash3"></i> Delete User
                </a>
            </div>
            <div class="action-link">
                <a href="SearchUser.jsp" class="btn btn-info btn-dashboard text-white">
                    <i class="bi bi-search"></i> Search Users
                </a>
            </div>
            <div class="action-link">
                <a href="ShowUsers.jsp" class="btn btn-success btn-dashboard">
                    <i class="bi bi-people-fill"></i> Show All Users
                </a>
            </div>
        </div>

        <div class="logout-btn mt-4">
            <a href="LogoutServlet" class="btn btn-outline-secondary btn-dashboard">
                <i class="bi bi-box-arrow-right"></i> Logout
            </a>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
