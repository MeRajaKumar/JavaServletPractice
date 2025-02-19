/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

/**
 *
 * @author teama
 */
@WebServlet(urlPatterns = {"/exp2servlet"})
public class exp2servlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        String a = session.getId();
        Date b = new Date(session.getCreationTime());
        Date c = new Date(session.getLastAccessedTime());

        
        String destroy = request.getParameter("destroy");

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<style> table, th, td {border:1px solid black;}</style>");
            out.println("<title>Servlet NewServlet1</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<center><table style=width:100%>");
            out.println("<tr>");
            out.println("<td><h1>Session ID: </h1></td>");
            out.println("<td><h1>" + a + "</h1></td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td><h1>Creation Time:  </h1></td>");
            out.println("<td><h1>" + b + "</h1></td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<td><h1>Last Accessed Time: </h1></td>");
            out.println("<td><h1>" + c + "</h1></td>");
            out.println("</tr>");
            out.println("</table></center>");

            
            if ("true".equals(destroy)) {
                
                session.invalidate(); 
                out.println("<h2 style='color:red;'>Session has been destroyed successfully!</h2>");
            } else {
                out.println("<form action='exp2servlet' method='POST'>");
                out.println("<input type='hidden' name='destroy' value='true'>");
                out.println("<button type='submit'>Destroy Session</button>");
                out.println("</form>");
            }

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
