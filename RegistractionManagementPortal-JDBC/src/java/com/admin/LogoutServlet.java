package com.admin;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        // Invalidate session
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // Set content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Beautiful logout confirmation HTML
        out.println("<!DOCTYPE html>");
        out.println("<html><head><title>Logged Out</title>");
        out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css' rel='stylesheet'>");
        out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css' rel='stylesheet'>");
        out.println("<style>");
        out.println("body { background: linear-gradient(to right, #e0f7fa, #fff); font-family: 'Segoe UI'; display: flex; justify-content: center; align-items: center; height: 100vh; }");
        out.println(".card { padding: 40px; border-radius: 15px; box-shadow: 0 10px 25px rgba(0,0,0,0.1); animation: fadeIn 0.6s ease-in; text-align: center; }");
        out.println("@keyframes fadeIn { from { opacity: 0; transform: scale(0.95); } to { opacity: 1; transform: scale(1); } }");
        out.println(".btn-custom { margin-top: 20px; padding: 10px 25px; font-weight: 500; }");
        out.println("</style></head><body>");

        out.println("<div class='card bg-light'>");
        out.println("<h3 class='text-success'><i class='bi bi-check-circle-fill'></i> Successfully Logged Out</h3>");
        out.println("<p>Thank you for using the Admin Panel. See you soon!</p>");
        out.println("<a href='index.jsp' class='btn btn-outline-primary btn-custom'><i class='bi bi-box-arrow-in-right'></i> Login Again</a>");
        out.println("</div>");

        out.println("</body></html>");
    }
}
