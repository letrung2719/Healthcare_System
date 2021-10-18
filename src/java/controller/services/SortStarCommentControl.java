/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.services;

import dal.ServicesDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Patient;
import model.ServiceFeedbacks;
import model.Services;
import model.Specialities;

/**
 *
 * @author hp
 */
@WebServlet(name = "SortStarFeedbackControl", urlPatterns = {"/sortStarComment"})
public class SortStarCommentControl extends HttpServlet {
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
        //////////
        //
        String star = request.getParameter("star");
        String id = request.getParameter("sid");
        ServicesDAO dal = new ServicesDAO();
        if (star.equals("all")) {
            List<ServiceFeedbacks> listF = dal.getAllComment(id);
            request.setAttribute("listF", listF);
        } else {
            List<ServiceFeedbacks> listFs = dal.getAllCommentSortedByStar(id, star);
            request.setAttribute("listF", listFs);
        }

        //lấy list các feedback của service có id trên và hiện theo số sao quy định
        //
        Services s = dal.getServiceByID(id);
        String specID = s.getType_id();
        request.setAttribute("detail", s);
        //lấy dữ liệu Service và id Speciality của Service
        //
        int avrate = dal.averageRateServices(id);
        request.setAttribute("avrate", avrate);
        //lấy rate trung bình của service
        //
        Specialities spec = dal.getSpecByID(specID);
        request.setAttribute("spec", spec);
        //lấy ra specialitie của Service
        //
        String type_id = dal.getServiceByID(id).getType_id();
        List<Services> listS = dal.getTop4Last(type_id);
        request.setAttribute("listS", listS);
        //lấy ra 4 service liên quan theo specialitie
        //
        List<ServiceFeedbacks> listF = dal.getAllComment(id);
        int totalfeedback = listF.size();
        request.setAttribute("totalfeedback", totalfeedback);
        //số feedback của service
        //
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        if (a != null) {
            if (a.getAuthor_id() == 2) {
                Patient p = (Patient) session.getAttribute("user");
                List<ServiceFeedbacks> check = dal.checkPatientComment((int) p.getPatientID(), id);
                if (check.isEmpty()) {
                    request.setAttribute("check", 1);
                } else {
                    request.setAttribute("check", 5);
                }
            }
        }
        ////////
        request.getRequestDispatcher("service-detail.jsp").forward(request, response);
        ////////
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
