<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Show All Users</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #e3f2fd, #fce4ec);
            font-family: 'Segoe UI', sans-serif;
            animation: fadeIn 0.6s ease-in-out;
        }

        .container {
            margin-top: 60px;
            animation: slideUp 0.6s ease-in-out;
        }

        .table thead {
            background-color: #007bff;
            color: white;
        }

        .btn-modify {
            color: #0d6efd;
            font-weight: 500;
        }

        .btn-remove {
            color: #dc3545;
            font-weight: 500;
        }

        .btn-modify:hover,
        .btn-remove:hover {
            text-decoration: underline;
        }

        .dashboard-button {
            display: block;
            margin: 30px auto 0;
            padding: 10px 25px;
            background-color: #198754;
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .dashboard-button:hover {
            background-color: #157347;
            transform: scale(1.05);
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideUp {
            from { transform: translateY(20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .add-user-btn {
            transition: all 0.3s ease;
        }

        .add-user-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Title & Add User Button -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0 text-primary"><i class="bi bi-people-fill"></i> Registered Users</h2>
        <a href="RegisterUser.jsp" class="btn btn-success fw-semibold shadow-sm add-user-btn">
            <i class="bi bi-person-plus-fill"></i> Add User
        </a>
    </div>

    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/admin_db", "root", "Dikshit@2002");
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM users");

            if (!rs.isBeforeFirst()) {
    %>
                <p class="text-center fs-5">No users found.</p>
    <%
            } else {
    %>
    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Age</th>
                    <th>Gender</th>
                    <th>Username</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
    <%
                while (rs.next()) {
    %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("first_name") %></td>
                    <td><%= rs.getString("last_name") %></td>
                    <td><%= rs.getInt("age") %></td>
                    <td><%= rs.getString("gender") %></td>
                    <td><%= rs.getString("username") %></td>
                    <td>
                        <!-- Delete Button Form -->
                        <form action="DeleteUserServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this user?');" style="display:inline;">
                            <input type="hidden" name="username" value="<%= rs.getString("username") %>">
                            <button type="submit" class="btn-remove btn btn-link p-0">
                                <i class="bi bi-trash3"></i> Remove
                            </button>
                        </form>
                        |
                        <a class="btn-modify" href="ModifyUser.jsp?id=<%= rs.getInt("id") %>">
                            <i class="bi bi-pencil-square"></i> Modify
                        </a>
                    </td>
                </tr>
    <%
                }
    %>
            </tbody>
        </table>
    </div>
    <%
            }
        } catch (Exception e) {
    %>
        <p class="text-center text-danger fw-bold">Error: <%= e.getMessage() %></p>
    <%
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>

    <a href="dashboard.jsp" class="dashboard-button"><i class="bi bi-house-door"></i> Go to Dashboard</a>
</div>

<!-- Bootstrap Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
