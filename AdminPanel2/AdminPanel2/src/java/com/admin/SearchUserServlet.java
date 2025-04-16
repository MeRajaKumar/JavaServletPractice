package com.admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class SearchUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html><head><title>Search Result</title>");
        out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css' rel='stylesheet'/>");
        out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css' rel='stylesheet'/>");
        out.println("<style>");
        out.println("body { background: #f8f9fa; font-family: 'Segoe UI', sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; }");
        out.println(".card { padding: 30px; border-radius: 15px; box-shadow: 0 10px 25px rgba(0,0,0,0.1); animation: fadeIn 0.6s ease-in-out; max-width: 500px; }");
        out.println("@keyframes fadeIn { from { opacity: 0; transform: translateY(-10px); } to { opacity: 1; transform: translateY(0); } }");
        out.println(".icon { font-size: 2.5rem; margin-bottom: 10px; }");
        out.println("</style>");
        out.println("</head><body><div class='card text-center'>");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE username = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                out.println("<div class='text-success'><i class='bi bi-person-check-fill icon'></i></div>");
                out.println("<h4>User Found</h4>");
                out.println("<p><strong>Name:</strong> " + rs.getString("first_name") + " " + rs.getString("last_name") + "</p>");
                out.println("<p><strong>Age:</strong> " + rs.getInt("age") + "</p>");
                out.println("<p><strong>Gender:</strong> " + rs.getString("gender") + "</p>");
            } else {
                out.println("<div class='text-danger'><i class='bi bi-person-x-fill icon'></i></div>");
                out.println("<h4>User Not Found</h4>");
                out.println("<p>The username <strong>" + username + "</strong> does not exist.</p>");
            }

            out.println("<div class='mt-4'>");
            out.println("<a href='dashboard.jsp' class='btn btn-outline-success me-2'><i class='bi bi-speedometer2'></i> Dashboard</a>");
            out.println("<a href='SearchUser.jsp' class='btn btn-outline-primary'><i class='bi bi-search'></i> Search Again</a>");
            out.println("</div>");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<div class='text-danger mt-4'><strong>Error:</strong> " + e.getMessage() + "</div>");
        }

        out.println("</div></body></html>");
    }
}
