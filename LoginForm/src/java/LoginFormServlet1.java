/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author teama
 */
@WebServlet(urlPatterns = {"/LoginFormServlet1"})
public class LoginFormServlet1 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        // Get the form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String number = request.getParameter("num");

        // Write the response
        try (PrintWriter out = response.getWriter()) {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Form Data</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Submitted Information</h1>");
            out.println("<p><strong>Name:</strong> " + name + "</p>");
            out.println("<p><strong>Email:</strong> " + email + "</p>");
            out.println("<p><strong>Password:</strong> " + number + "</p>");
            out.println("<p><strong>Password:</strong> " + password + "</p>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}