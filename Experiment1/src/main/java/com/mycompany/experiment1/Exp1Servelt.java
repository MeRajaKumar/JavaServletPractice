/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.experiment1;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import static java.lang.System.out;

/**
 *
 * @author teama
 */
@WebServlet(name = "Exp1Servelt", urlPatterns = {"/Exp1Servelt"})
public class Exp1Servelt extends HttpServlet {

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
//        response.setContentType("text/html;charset=UTF-8");
        
            int i = Integer.parseInt(req.getParameter("firstnum"));
            int j = Integer.parseInt(req.getParameter("secondnum"));
 
            int k = i + j;
            PrintWriterout = res.getWriter();
            out.println("<bodystyle='background-color:black;'>");
            out.printIn("<h1style='font-size:30px;color:blue;'>TheSumis:"+k+"</h1>");
        }
    }
