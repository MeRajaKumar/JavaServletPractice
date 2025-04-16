package com.admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class RegisterUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fname = request.getParameter("firstName");
        String lname = request.getParameter("lastName");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html><head>");
        out.println("<title>User Registration</title>");

        // Bootstrap & Icons
        out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css' rel='stylesheet'/>");
        out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css' rel='stylesheet'/>");

        // Styles
        out.println("<style>");
        out.println("body { background: linear-gradient(to right, #e3f2fd, #ffffff); display: flex; justify-content: center; align-items: center; height: 100vh; font-family: 'Segoe UI', sans-serif; }");
        out.println(".card { padding: 40px; border-radius: 15px; box-shadow: 0 12px 30px rgba(0,0,0,0.1); animation: fadeIn 0.6s ease-in-out; text-align: center; }");
        out.println("@keyframes fadeIn { from {opacity: 0; transform: translateY(-20px);} to {opacity: 1; transform: translateY(0);} }");
        out.println(".btn-custom { margin: 15px 10px 0 10px; padding: 10px 25px; font-weight: 500; }");
        out.println(".icon-large { font-size: 2.5rem; }");
        out.println("</style>");

        out.println("</head><body>");
        out.println("<div class='card'>");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO users (first_name, last_name, age, gender, username, password) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, fname);
            stmt.setString(2, lname);
            stmt.setInt(3, age);
            stmt.setString(4, gender);
            stmt.setString(5, username);
            stmt.setString(6, password);
            stmt.executeUpdate();

            out.println("<div class='text-success'><i class='bi bi-check-circle-fill icon-large'></i></div>");
            out.println("<h4 class='mt-3'>User registered successfully!</h4>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<div class='text-danger'><i class='bi bi-x-circle-fill icon-large'></i></div>");
            out.println("<h4 class='mt-3'>Error: " + e.getMessage() + "</h4>");
        }

        // Navigation buttons
        out.println("<div class='d-flex justify-content-center'>");
        out.println("<a href='RegisterUser.jsp' class='btn btn-outline-primary btn-custom'><i class='bi bi-person-plus'></i> Register Another</a>");
        out.println("<a href='dashboard.jsp' class='btn btn-outline-success btn-custom'><i class='bi bi-speedometer2'></i> Dashboard</a>");
        out.println("</div>");

        out.println("</div>"); // end card
        out.println("</body></html>");
    }
}
