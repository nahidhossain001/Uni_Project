/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.User;
import dao.ManageUsers;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kaif Ul Majed
 */
public class LoginProcess extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginProcess</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginProcess at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        response.setContentType("text/html");  
        PrintWriter out = response.getWriter();  
        RequestDispatcher view;
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if(username.equals("admin")&& password.equals("admin")){
            HttpSession session=request.getSession();
            session.setAttribute("id", username);
            //response.sendRedirect("Loggedin");
            view=request.getRequestDispatcher("admin.jsp");
            view.forward(request, response);
        }
        
        ManageUsers mu = new ManageUsers();
        User u = mu.getUser(username, password);
        
        if (u != null){
            //out.print("Welcome " + u.getUsername());
            HttpSession session=request.getSession();
            session.setAttribute("id", username);
            //response.sendRedirect("Loggedin");
            view=request.getRequestDispatcher("index.jsp");
            view.forward(request, response);
            
        }
        else{
            HttpSession session=request.getSession();
            session.setAttribute("loginstatus", "Enter correct Username and password");
            //response.sendRedirect("Loggedin");
            view=request.getRequestDispatcher("loginregistration.jsp");
            view.forward(request, response);
        }
        out.close();
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
