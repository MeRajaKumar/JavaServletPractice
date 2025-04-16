package com.admin;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class AdminDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (session == null || session.getAttribute("adminUser") == null) {
            // Not logged in — show beautiful alert
            out.println("<!DOCTYPE html>");
            out.println("<html><head><title>Unauthorized</title>");
            out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css' rel='stylesheet'>");
            out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css' rel='stylesheet'>");
            out.println("<style>");
            out.println("body { background: linear-gradient(to right, #f8d7da, #fff); font-family: 'Segoe UI'; display: flex; justify-content: center; align-items: center; height: 100vh; }");
            out.println(".card { padding: 30px; border-radius: 15px; box-shadow: 0 10px 25px rgba(0,0,0,0.1); animation: slideIn 0.5s ease; }");
            out.println("@keyframes slideIn { from { transform: translateY(-30px); opacity: 0; } to { transform: translateY(0); opacity: 1; } }");
            out.println("</style></head><body>");
            out.println("<div class='card text-center bg-light'>");
            out.println("<h4 class='text-danger'><i class='bi bi-lock-fill'></i> Access Denied</h4>");
            out.println("<p>You must be logged in to view the dashboard.</p>");
            out.println("<a href='index.jsp' class='btn btn-outline-danger mt-2'><i class='bi bi-box-arrow-in-right'></i> Go to Login</a>");
            out.println("</div></body></html>");
        } else {
            // Logged in — forward to dashboard.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
            dispatcher.forward(request, response);
        }
    }
}
