package com.admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class DeleteUserServlet extends HttpServlet {

    // 👉 Handles POST request from delete_user_form.html
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username"); // ✅ Fetch from form

        out.println("<!DOCTYPE html>");
        out.println("<html><head><title>Delete User</title>");
        out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css' rel='stylesheet'>");
        out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css' rel='stylesheet'>");
        out.println("<style>");
        out.println("body { background: #eef2f7; font-family: 'Segoe UI', sans-serif; display: flex; justify-content: center; align-items: center; min-height: 100vh; }");
        out.println(".card { background: white; padding: 30px; border-radius: 16px; box-shadow: 0 10px 30px rgba(0,0,0,0.1); text-align: center; max-width: 500px; width: 100%; animation: fadeIn 0.5s ease-in-out; }");
        out.println("@keyframes fadeIn { from { opacity: 0; transform: translateY(-10px); } to { opacity: 1; transform: translateY(0); } }");
        out.println(".icon { font-size: 3rem; margin-bottom: 15px; }");
        out.println(".btn-group { margin-top: 25px; display: flex; justify-content: center; gap: 15px; }");
        out.println("</style>");
        out.println("</head><body><div class='card'>");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM users WHERE username = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username); // ✅ Use username for deletion
            int rowsDeleted = stmt.executeUpdate();

            if (rowsDeleted > 0) {
                out.println("<div class='text-success'><i class='bi bi-check-circle-fill icon'></i></div>");
                out.println("<h4 class='text-success'>User '" + username + "' deleted successfully!</h4>");
            } else {
                out.println("<div class='text-warning'><i class='bi bi-info-circle-fill icon'></i></div>");
                out.println("<h4 class='text-warning'>User not found or already deleted.</h4>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<div class='text-danger'><i class='bi bi-x-circle-fill icon'></i></div>");
            out.println("<h4 class='text-danger'>Error deleting user:</h4>");
            out.println("<p class='text-muted'>" + e.getMessage() + "</p>");
        }

        out.println("<div class='btn-group'>");
        out.println("<a href='ShowUsers.jsp' class='btn btn-outline-primary'><i class='bi bi-people'></i> Show Users</a>");
        out.println("<a href='dashboard.jsp' class='btn btn-success'><i class='bi bi-speedometer2'></i> Dashboard</a>");
        out.println("</div>");

        out.println("</div></body></html>");
    }

    // 👇 Optional: redirect GET to form page
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("delete_user_form.html"); // Redirect to your HTML form if needed
    }
}
