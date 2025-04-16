package com.admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class ModifyUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String gender = request.getParameter("gender");
        String ageStr = request.getParameter("age");

        StringBuilder sql = new StringBuilder("UPDATE users SET ");
        boolean hasUpdate = false;

        if (!fname.isEmpty()) {
            sql.append("first_name = ?, ");
            hasUpdate = true;
        }
        if (!lname.isEmpty()) {
            sql.append("last_name = ?, ");
            hasUpdate = true;
        }
        if (!ageStr.isEmpty()) {
            sql.append("age = ?, ");
            hasUpdate = true;
        }
        if (!gender.isEmpty()) {
            sql.append("gender = ?, ");
            hasUpdate = true;
        }

        out.println("<!DOCTYPE html>");
        out.println("<html><head><title>Modify User</title>");
        out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css' rel='stylesheet'>");
        out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css' rel='stylesheet'>");
        out.println("<style>");
        out.println("body { background: linear-gradient(to right, #e0f7fa, #ffffff); font-family: 'Segoe UI', sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; }");
        out.println(".card { padding: 40px; border-radius: 20px; box-shadow: 0 12px 35px rgba(0, 0, 0, 0.15); text-align: center; animation: fadeIn 0.6s ease-in-out; }");
        out.println("@keyframes fadeIn { from { opacity: 0; transform: scale(0.95); } to { opacity: 1; transform: scale(1); } }");
        out.println(".icon { font-size: 2.8rem; margin-bottom: 10px; }");
        out.println(".btn-custom { margin: 10px; padding: 10px 25px; }");
        out.println("</style>");
        out.println("</head><body><div class='card'>");

        if (!hasUpdate) {
            out.println("<div class='text-danger'><i class='bi bi-exclamation-triangle-fill icon'></i></div>");
            out.println("<h4>No update fields were provided!</h4>");
            addNavigationButtons(out);
            out.println("</div></body></html>");
            return;
        }

        sql.setLength(sql.length() - 2); // remove trailing comma
        sql.append(" WHERE username = ?");

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement stmt = conn.prepareStatement(sql.toString());

            int index = 1;
            if (!fname.isEmpty()) stmt.setString(index++, fname);
            if (!lname.isEmpty()) stmt.setString(index++, lname);
            if (!ageStr.isEmpty()) stmt.setInt(index++, Integer.parseInt(ageStr));
            if (!gender.isEmpty()) stmt.setString(index++, gender);
            stmt.setString(index, username);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                out.println("<div class='text-success'><i class='bi bi-check-circle-fill icon'></i></div>");
                out.println("<h4>User updated successfully!</h4>");
            } else {
                out.println("<div class='text-warning'><i class='bi bi-info-circle-fill icon'></i></div>");
                out.println("<h4>User not found or no changes made.</h4>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<div class='text-danger'><i class='bi bi-x-octagon-fill icon'></i></div>");
            out.println("<h4>Error occurred: " + e.getMessage() + "</h4>");
        }

        addNavigationButtons(out);
        out.println("</div></body></html>");
    }

    private void addNavigationButtons(PrintWriter out) {
        out.println("<div class='mt-4'>");
        out.println("<a href='ModifyUser.jsp' class='btn btn-outline-primary btn-custom'><i class='bi bi-pencil'></i> Modify Another</a>");
        out.println("<a href='dashboard.jsp' class='btn btn-success btn-custom'><i class='bi bi-speedometer2'></i> Dashboard</a>");
        out.println("</div>");
    }
}
