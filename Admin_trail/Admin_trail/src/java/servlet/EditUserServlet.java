package servlet;

import dao.UserDAO;
import model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/edit")  // ← Add this line to map the servlet to "/edit" URL

public class EditUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        User user = new User(id, name, email);
        UserDAO.updateUser(user);
        response.sendRedirect("list");
    }
}
