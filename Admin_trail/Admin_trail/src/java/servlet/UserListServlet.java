package servlet;

import dao.UserDAO;
import model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/list")
public class UserListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔒 Check if admin is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            System.out.println("❌ Admin not logged in. Redirecting to login.jsp");
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // ✅ Load users from DAO
            List<User> users = UserDAO.getAllUsers();
            System.out.println("📦 Users fetched: " + (users != null ? users.size() : "null"));

            // Set attribute for JSP
            request.setAttribute("userList", users);

            // Forward to JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("user-list.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            response.getWriter().println("<h3>Error loading users: " + e.getMessage() + "</h3>");
        }
    }
}
