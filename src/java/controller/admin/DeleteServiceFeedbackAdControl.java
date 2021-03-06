/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dal.ServicesDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ServiceFeedbacks;
import model.Services;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "DeleteServiceFeedbackAdControl", urlPatterns = {"/admin-role/delete_ser"})
public class DeleteServiceFeedbackAdControl extends HttpServlet {

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
        try {
            String feedback_id = request.getParameter("fid");

            String serID = request.getParameter("serID");
            String star = request.getParameter("star");

            System.out.println("====================" + star + "======================");
            int id = Integer.parseInt(feedback_id);

            ServicesDAO dal = new ServicesDAO();
            Services s = dal.getServiceByID(serID);

            dal.deleteComment(id);

            if (star.equals("all")) {
                List<ServiceFeedbacks> listS = dal.getAllComment(serID);
                request.setAttribute("detail", s);
                request.setAttribute("ListS", listS);
            } else {
                List<ServiceFeedbacks> listFs = dal.getAllCommentSortedByStar(serID, star);
                request.setAttribute("detail", s);
                request.setAttribute("ListS", listFs);
            }

            request.getRequestDispatcher("/admin-role/serfeed?star=" + star + "&&id=" + serID).forward(request, response);

        } catch (IOException | NumberFormatException | SQLException | ServletException e) {
            System.out.println(e);
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
