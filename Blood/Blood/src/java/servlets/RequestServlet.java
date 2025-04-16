package servlets;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class RequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String name = req.getParameter("name");
        String blood = req.getParameter("blood");
        String contact = req.getParameter("contact");

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO requests(name, blood_group, contact) VALUES (?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, blood);
            ps.setString(3, contact);
            ps.executeUpdate();

            res.sendRedirect("success.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
