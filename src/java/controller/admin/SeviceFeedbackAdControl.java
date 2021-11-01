/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dal.ServicesDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "SeviceFeedbackAdControl", urlPatterns = {"/admin-role/serfeed"})
public class SeviceFeedbackAdControl extends HttpServlet {

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

        try {
            response.setContentType("text/html;charset=UTF-8");
            String serID = request.getParameter("id");
            String star = request.getParameter("star");

            ServicesDAO dal = new ServicesDAO();
            Services s = dal.getServiceByID(serID);
//        List<ServiceFeedbacksAd> listS = dal.getAllCommentAd(serID);
//        for (ServiceFeedbacksAd i : listS) {
//            System.out.println(i);
//        }

            if (star.equals("all")) {
                List<ServiceFeedbacks> listS = dal.getAllComment(serID);
                request.setAttribute("star", star);
                request.setAttribute("detail", s);
                request.setAttribute("ListS", listS);
            } else {
                List<ServiceFeedbacks> listFs = dal.getAllCommentSortedByStar(serID, star);
                request.setAttribute("star", star);
                request.setAttribute("detail", s);
                request.setAttribute("ListS", listFs);
            }

            request.getRequestDispatcher("/admin-role/service-feedback.jsp").forward(request, response);
        } catch (IOException | ServletException | SQLException e) {
            System.out.println(e);
        }

    }

//        String serID = request.getParameter("id");
//        ServicesDAO dal = new ServicesDAO();
//        List<ServiceFeedbacksAd> listS = dal.getAllCommentAd(serID);
//        for (ServiceFeedbacksAd i : listS) {
//            System.out.println(i);
//        }
//
//        request.setAttribute("listS", listS);
//
//        request.getRequestDispatcher("/admin/service-feedback.jsp").forward(request, response);
//    }
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
