/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.DoctorFeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DoctorFeedback;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DoctorFeedbackListControl", urlPatterns = {"/doctorFeedbackList"})
public class DoctorFeedbackListControl extends HttpServlet {

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
        int doctorID = Integer.parseInt(request.getParameter("doctorID"));
        int indexPage;
        String sortBy = request.getParameter("sort");
        String getInputPage = request.getParameter("page");
        if (getInputPage == null) {
            indexPage = 1;
        } else {
            indexPage = Integer.parseInt(getInputPage);
        }
        DoctorFeedbackDAO db1 = new DoctorFeedbackDAO();
        int totalFeedback = db1.countAllDoctorFeedback(doctorID);
        int numberOfItem = 4;
        int numberOfPage = totalFeedback / numberOfItem + (totalFeedback % numberOfItem == 0 ? 0 : 1);
        List<DoctorFeedback> listdFb = new ArrayList<DoctorFeedback>();
        
        if (sortBy == null) {
            listdFb = db1.paginateDoctorFeedbackByDoctorID(doctorID, indexPage, numberOfItem, "feedback_id");
        }
        request.setAttribute("listdFb", listdFb);
        request.setAttribute("indexPage", indexPage);
        request.setAttribute("numberOfPage", numberOfPage);
        request.getRequestDispatcher("doctor-feedback-list.jsp").forward(request, response);
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
