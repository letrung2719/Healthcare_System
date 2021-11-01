/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dal.BlogsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Blogs;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "SearchBlogsControl", urlPatterns = {"/admin-role/search-blog"})
public class SearchBlogsControl extends HttpServlet {

    private static final long serialVersionUID = 9999L;

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
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            String title = request.getParameter("title");
            String date = request.getParameter("date");
//            SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");           
//            String strDate = formatter1.format(date);
            
//            String pattern = "yyyy-MM-dd";
//
//        // Create an instance of SimpleDateFormat used for formatting 
//        // the string representation of date according to the chosen pattern
//            DateFormat df = new SimpleDateFormat(pattern);
//        // Using DateFormat format method we can create a string 
//        // representation of a date with the defined format.
//            String dateformat = df.format(date);
            
            BlogsDAO dao = new BlogsDAO();
            List<Blogs> bl = dao.search(title, date);
            
            request.setAttribute("date", date);
            request.setAttribute("title", title);
            request.setAttribute("listBlog", bl);
            request.getRequestDispatcher("/admin-role/blog-managerment.jsp").forward(request, response);
        } catch (IOException | SQLException | ServletException e) {
            System.out.println(e);
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
