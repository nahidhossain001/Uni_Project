/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ManageCart;
import dao.ManageMedicine;
import dao.ManageUsers;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Medicine;
import model.User;

/**
 *
 * @author Riad
 */
public class CartServlet extends HttpServlet {

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
            out.println("<title>Servlet cartServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet cartServlet at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        HttpSession session=request.getSession();
        ManageUsers mu=new ManageUsers();
        User u = mu.getByUserName((String)session.getAttribute("id"));
        ManageCart mc=new ManageCart();
        ManageMedicine mm = new ManageMedicine();
        int id=u.getId();
        List <Cart> cartItems = mc.viewCart(id);
        List <Medicine> meds = new ArrayList<Medicine>();
        for (Cart c : cartItems){
            Medicine m = mm.getMedById(c.getMed_id());
            meds.add(m);
        }
        request.setAttribute("cart", cartItems);
        request.setAttribute("meds", meds);
        request.getRequestDispatcher("cartView.jsp").forward(request,response);
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
        int quantity=Integer.parseInt((String)request.getParameter("quantity"));
        int medid=Integer.parseInt((String)request.getParameter("id"));
        ManageUsers mu = new ManageUsers();
        HttpSession session=request.getSession();
        User u = mu.getByUserName((String)session.getAttribute("id"));
        int id=u.getId();
        session.setAttribute("userid", id);
        ManageCart mc=new ManageCart();
        Cart c=new Cart(id, medid, quantity);
        mc.addtoCart(c);
        response.sendRedirect("/TopUpWebProject/ProductsServlet");


                
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
