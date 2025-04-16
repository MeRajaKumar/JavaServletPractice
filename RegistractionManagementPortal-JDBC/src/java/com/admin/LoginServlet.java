package com.admin;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // HTML + Bootstrap setup
        out.println("<!DOCTYPE html>");
        out.println("<html><head><title>Login</title>");
        out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css' rel='stylesheet'>");
        out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css' rel='stylesheet'>");
        out.println("<style>");
        out.println("body { background: linear-gradient(to right, #e3f2fd, #ffffff); font-family: 'Segoe UI'; display: flex; justify-content: center; align-items: center; height: 100vh; }");
        out.println(".card { padding: 30px; border-radius: 15px; box-shadow: 0 10px 25px rgba(0,0,0,0.1); animation: fadeIn 0.5s ease-in-out; }");
        out.println("@keyframes fadeIn { from { opacity: 0; transform: translateY(-20px); } to { opacity: 1; transform: translateY(0); } }");
        out.println("</style></head><body><div class='card text-center'>");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM admins WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("adminUser", username);

                out.println("<h4 class='text-success'><i class='bi bi-check-circle-fill'></i> Login successful!</h4>");
                out.println("<p>Welcome, <strong>" + username + "</strong></p>");
                out.println("<a href='dashboard.jsp' class='btn btn-success mt-3'><i class='bi bi-speedometer2'></i> Go to Dashboard</a>");
            } else {
                out.println("<h4 class='text-danger'><i class='bi bi-x-circle-fill'></i> Invalid credentials!</h4>");
                out.println("<a href='index.jsp' class='btn btn-outline-danger mt-3'><i class='bi bi-arrow-left'></i> Try Again</a>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h4 class='text-danger'><i class='bi bi-bug-fill'></i> Server Error: " + e.getMessage() + "</h4>");
            out.println("<a href='index.jsp' class='btn btn-outline-secondary mt-3'>Back to Login</a>");
        }

        out.println("</div></body></html>");
    }
}
