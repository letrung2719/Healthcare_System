/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import javax.servlet.http.HttpSession;

/**
 *
 * @author TrungLT
 */
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
//        response.sendRedirect("login.jsp");
        response.sendRedirect("login.jsp");
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
        //Cach 1: Luu username va password o context-pram - web.xml
//        PrintWriter out = response.getWriter();
//        //Lay tu form
//        String user = request.getParameter("user");
//        String pass = request.getParameter("pass");
//        //Lay tu context-pram - web.xml
//        String validUser = getServletContext().getInitParameter("user");
//        String validPass = getServletContext().getInitParameter("pass");
//        //So sanh
//        if (user.equals(validUser) && pass.equals(validPass)) {
//            out.println("Welcome " + user + " !");
//        } else {
//            out.println("Invalid user or password!");
//        }
        
        //Cach 2: Doc tu database
        //Lay tu form
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        
        AccountDAO db = new AccountDAO();
        Account ac = db.getAccount(user, pass);
        if(ac == null){
            //invalid 
            request.setAttribute("error", "invalid account");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }else{
            //valid
            HttpSession session = request.getSession();
            session.setAttribute("account", ac);
            response.sendRedirect("list");
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
