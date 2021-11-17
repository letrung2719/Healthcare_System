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
import java.util.ResourceBundle;
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
@WebServlet(name = "UpdateBlogControl", urlPatterns = {"/admin-role/edit-blog"})
public class UpdateBlogControl extends HttpServlet {

    ResourceBundle resourceBundle = ResourceBundle.getBundle("resources/message");
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
            out.println("<title>Servlet sd</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sd at " + request.getContextPath() + "</h1>");
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
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            int blogID = Integer.parseInt(request.getParameter("id"));

            BlogsDAO bl = new BlogsDAO();
            Blogs blog = bl.getBlogByBlogID(blogID);

            request.setAttribute("blog", blog);
            request.getRequestDispatcher("/admin-role/edit-blog.jsp").forward(request, response);
        } catch (IOException | SQLException e) {
            System.out.println(e);
        }
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
            int blogID = Integer.parseInt(request.getParameter("blogId"));
            String date = request.getParameter("date");
            String title = request.getParameter("title");
            String image = request.getParameter("image");
            String des = request.getParameter("description");

            if (title.equals("") || image.equals("") || des.equals("")) {
                request.setAttribute("mess", resourceBundle.getString("input_check_null"));
                request.getRequestDispatcher("edit-blog?id=" + blogID).forward(request, response);
            } else {
                Blogs bl1 = new Blogs(blogID, title, date, image, des);
                BlogsDAO bl = new BlogsDAO();
                bl.editBlog(bl1);
                request.setAttribute("mess", resourceBundle.getString("success"));
                request.getRequestDispatcher("edit-blog?id=" + blogID).forward(request, response);
            }
        } catch (IOException | SQLException e) {
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
