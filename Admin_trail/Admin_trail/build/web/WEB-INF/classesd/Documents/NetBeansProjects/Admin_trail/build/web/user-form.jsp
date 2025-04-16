<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.UserDAO, model.User" %>
<%
    String idParam = request.getParameter("id");
    User user = new User();
    String action = "add";

    if (idParam != null) {
        int id = Integer.parseInt(idParam);
        user = UserDAO.getUser(id);
        action = "edit";
    }
%>
<html>
<head>
    <title><%= action.equals("add") ? "Add User" : "Edit User" %></title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        label {
            font-weight: 500;
            margin-bottom: 6px;
            display: block;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2><%= action.equals("add") ? "Add" : "Edit" %> User</h2>
    <form action="<%= action %>" method="post">
        <% if (action.equals("edit")) { %>
            <input type="hidden" name="id" value="<%= user.getId() %>">
        <% } %>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= user.getName() != null ? user.getName() : "" %>" required>

        <label for="email">Email:</label>
        <input type="text" id="email" name="email" value="<%= user.getEmail() != null ? user.getEmail() : "" %>" required>

        <input type="submit" value="<%= action.equals("add") ? "Add" : "Update" %>">
    </form>
</div>

</body>
</html>
