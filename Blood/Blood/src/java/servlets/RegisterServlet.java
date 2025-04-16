package servlets;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        String blood = req.getParameter("blood");
        String contact = req.getParameter("contact");
        String city = req.getParameter("city");

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO donors(name, age, blood_group, contact, city) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, name);
            ps.setInt(2, age);
            ps.setString(3, blood);
            ps.setString(4, contact);
            ps.setString(5, city);
            ps.executeUpdate();

            res.sendRedirect("success.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
