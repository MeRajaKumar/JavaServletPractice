package servlet;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.User;

@WebServlet("/add")  // ← This is the missing part that fixes the 404 error

public class AddUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        User user = new User();
        user.setName(name);
        user.setEmail(email);

        UserDAO.addUser(user);
        response.sendRedirect("list");
    }
}
