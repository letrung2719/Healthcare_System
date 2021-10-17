/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.DoctorDAO;
import dal.DoctorFeedbacksDAO;
import dal.PatientDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Doctor;
import model.DoctorFeedbacks;
import model.Patient;

/**
 *
 * @author admin
 */
@WebServlet(name = "DoctorFeedbacksControl", urlPatterns = {"/doctor_feedbacks"})
public class DoctorFeedbacksControl extends HttpServlet {
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DoctorFeedbacksControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DoctorFeedbacksControl at " + request.getContextPath() + "</h1>");
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
            String action = request.getParameter("action");
            if (action.equals("delete")) {
                int patient_id = Integer.parseInt(request.getParameter("patient_id"));
                int doctor_id = Integer.parseInt(request.getParameter("doctor_id"));
                DoctorFeedbacksDAO db = new DoctorFeedbacksDAO();
                db.deleteDoctorFeedback(patient_id, doctor_id);
                
                DoctorDAO doctorDB = new DoctorDAO();
                Doctor doctor = doctorDB.getDoctorByDoctorID(doctor_id);
                response.sendRedirect(request.getContextPath() + "/doctor_profile_view?id=" + doctor.getAccountID());
            }
            if (action.equals("edit")) {

            }
        } catch (IOException | NumberFormatException e) {
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
            String content = request.getParameter("content");
            int rating = Integer.parseInt(request.getParameter("rating"));
            Date curDate = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String date = formatter.format(curDate);

            int patient_id = Integer.parseInt(request.getParameter("patient_id"));
            PatientDAO patientDB = new PatientDAO();
            Patient patient = patientDB.getPatientByPatientID(patient_id);

            int doctor_id = Integer.parseInt(request.getParameter("doctor_id"));
            DoctorDAO doctorDB = new DoctorDAO();
            Doctor doctor = doctorDB.getDoctorByDoctorID(doctor_id);

            DoctorFeedbacks feedback = new DoctorFeedbacks(date, content, rating, patient, doctor);
            DoctorFeedbacksDAO feedbackDB = new DoctorFeedbacksDAO();
            feedbackDB.addNewDoctorFeedback(feedback);
            response.sendRedirect(request.getContextPath() + "/doctor_profile_view?id=" + doctor.getAccountID());
        } catch (NumberFormatException e) {
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
