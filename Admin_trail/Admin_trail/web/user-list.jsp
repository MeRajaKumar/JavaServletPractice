<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.User" %>
<%
    List<User> users = (List<User>) request.getAttribute("userList");
%>
<html>
<head>
    <title>User List</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 30px;
        }

        h2 {
            color: #333;
            text-align: center;
        }

        .add-btn {
            display: inline-block;
            margin-bottom: 20px;
            background-color: #28a745;
            color: #fff;
            padding: 10px 16px;
            text-decoration: none;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        .add-btn:hover {
            background-color: #218838;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .action-btn {
            margin-right: 8px;
            padding: 6px 12px;
            border: none;
            text-decoration: none;
            color: white;
            border-radius: 4px;
            font-size: 14px;
        }

        .edit-btn {
            background-color: #ffc107;
        }

        .edit-btn:hover {
            background-color: #e0a800;
        }

        .delete-btn {
            background-color: #dc3545;
        }

        .delete-btn:hover {
            background-color: #c82333;
        }

        .no-users {
            text-align: center;
            margin-top: 20px;
            color: #666;
        }
    </style>
</head>
<body>

<h2>User List</h2>
<a href="user-form.jsp" class="add-btn">+ Add User</a>

<% if (users != null && !users.isEmpty()) { %>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
        <% for (User user : users) { %>
            <tr>
                <td><%= user.getId() %></td>
                <td><%= user.getName() %></td>
                <td><%= user.getEmail() %></td>
                <td>
                    <a href="user-form.jsp?id=<%= user.getId() %>" class="action-btn edit-btn">Edit</a>
                    <a href="delete?id=<%= user.getId() %>" class="action-btn delete-btn">Delete</a>
                </td>
            </tr>
        <% } %>
    </table>
<% } else { %>
    <p class="no-users">No users found.</p>
<% } %>

</body>
</html>
