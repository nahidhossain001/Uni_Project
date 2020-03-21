/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.Medicine;
import dao.ManageMedicine;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kaif Ul Majed
 */
public class ProductsServlet extends HttpServlet {

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
            out.println("<title>Servlet ProductsServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductsServlet at " + request.getContextPath() + "</h1>");
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
        // processRequest(request, response);
        ManageMedicine mm = new ManageMedicine();
        List <Medicine> meds = mm.getAllMeds();
        request.setAttribute("meds", meds);
        request.getRequestDispatcher("products.jsp").forward(request,response);
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
if(request.getParameter("cat")!=null){
        String type = request.getParameter("cat");
        ManageMedicine mm = new ManageMedicine();
        List <Medicine> meds = mm.getMedByType(type);
        request.setAttribute("cat", null);
        request.setAttribute("meds", meds);
        request.getRequestDispatcher("products.jsp").forward(request,response);        
}else{
    String name=(String)request.getParameter("medname");
    String searchby=(String)request.getParameter("searchby");
//    PrintWriter out=response.getWriter();
//    out.print(name);
//    out.print(searchby);
    ManageMedicine mm = new ManageMedicine();
    List <Medicine> meds=null;
        if(searchby.equals("name")){
            
             meds = mm.getMedByName(name);
        }else if(searchby.equals("genericname")){
             meds = mm.getMedByGenericName(name);
        }else if(searchby.equals("type")){
             meds = mm.getMedByType(name);
}
        request.setAttribute("meds", meds);
        request.getRequestDispatcher("products.jsp").forward(request,response);

    }
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
