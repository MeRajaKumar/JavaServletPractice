package servlets;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String blood = req.getParameter("blood");
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM donors WHERE blood_group = ?");
            ps.setString(1, blood);
            ResultSet rs = ps.executeQuery();

            out.println("<!DOCTYPE html>");
            out.println("<html><head><title>Search Results</title>");
            out.println("<style>");
            out.println("body { font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 20px; }");
            out.println("h2 { color: #b30000; }");
            out.println(".donor { background: #fff; padding: 15px; margin-bottom: 15px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }");
            out.println(".donor p { margin: 5px 0; }");
            out.println("</style></head><body>");

            out.println("<h2>Matching Donors for Blood Group: " + blood + "</h2>");

            boolean found = false;
            while (rs.next()) {
                found = true;
                out.println("<div class='donor'>");
                out.println("<p><strong>Name:</strong> " + rs.getString("name") + "</p>");
                out.println("<p><strong>Contact:</strong> " + rs.getString("contact") + "</p>");
                out.println("<p><strong>City:</strong> " + rs.getString("city") + "</p>");
                out.println("</div>");
            }

            if (!found) {
                out.println("<p>No donors found with blood group " + blood + ".</p>");
            }

            out.println("</body></html>");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p style='color:red;'>Error fetching donor data.</p>");
        }
    }
}
