/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.DoctorDAO;
import dal.DoctorFeedbacksDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Doctor;
import model.DoctorFeedbacks;
import model.Patient;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ViewDoctorProfile", urlPatterns = {"/doctor_profile_view"})
public class ViewDoctorProfile extends HttpServlet {

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
            int accountID = Integer.parseInt(request.getParameter("id"));
            DoctorDAO doctorDb = new DoctorDAO();
            Doctor doctor = doctorDb.getDoctorByAccountID(accountID);
            request.setAttribute("doctor", doctor);

            DoctorFeedbacksDAO feedbackDB = new DoctorFeedbacksDAO();
            List<DoctorFeedbacks> feedbacksList = feedbackDB.getAllDoctorFeedbacks(doctor.getDoctorID());
            request.setAttribute("feedbacksList", feedbacksList);
            int avgrate = feedbackDB.getAverageRating(doctor.getDoctorID());
            request.setAttribute("avgrate", avgrate);

            HttpSession session = request.getSession();
            Patient curUser = (Patient) session.getAttribute("user");
            if (curUser != null) {
                for (DoctorFeedbacks fb : feedbacksList) {
                    if (fb.getPatient().getPatientID() == curUser.getPatientID() && fb.getDoctor().getDoctorID() == doctor.getDoctorID()) {
                        request.setAttribute("check", true);
                    }
                }
            }
            request.getRequestDispatcher("doctor-details.jsp").forward(request, response);
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
