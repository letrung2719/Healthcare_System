/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dal.AccountDAO;
import dal.AppointmentDAO;
import dal.DoctorDAO;
import dal.DoctorFeedbacksDAO;
import dal.ServicesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Appointment;
import model.Doctor;
import model.DoctorFeedbacks;

/**
 *
 * @author admin
 */
@WebServlet(name = "DoctorProfileAdmin", urlPatterns = {"/admin-role/doctor_profile_admin"})
public class DoctorProfileAdmin extends HttpServlet {

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
        int doctorID = Integer.parseInt(request.getParameter("id"));
        
        DoctorDAO doctorDb = new DoctorDAO();
        AppointmentDAO appDb = new AppointmentDAO();
        AccountDAO accountDb = new AccountDAO();
        DoctorFeedbacksDAO feedDb = new DoctorFeedbacksDAO();
        ServicesDAO serDb = new ServicesDAO();
        
        List<DoctorFeedbacks> listFb = new ArrayList<>();
        listFb = feedDb.getAllDoctorFeedbacks(doctorID);
        
        int indexPage;
            String getInputPage = request.getParameter("page");
            if (getInputPage == null) {
                indexPage = 1;
            } else {
                indexPage = Integer.parseInt(getInputPage);
            }
            int totalAppointment = appDb.getAllDoctorAppointment(doctorID);
            int numberOfItem = 5;
            int numberOfPage = totalAppointment / numberOfItem + (totalAppointment % numberOfItem == 0 ? 0 : 1);
            int start = (indexPage - 1) * numberOfItem;
            List<Appointment> listApp = appDb.paginateAppointmentByDoctorID(doctorID, start, numberOfItem);
        
        Doctor doctor = doctorDb.getDoctorByAccountID(doctorID);
        Account account = accountDb.getAccountByID(doctorID);
        
        request.setAttribute("listFb", listFb);
        request.setAttribute("account", account);
        request.setAttribute("listApp", listApp);
        request.setAttribute("doctor", doctor);      
        request.getRequestDispatcher("/admin-role/doctor_profile.jsp").forward(request, response);
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
//        try {
//            int id = Integer.parseInt(request.getParameter("account_id"));
//            
//            AccountDAO accountDb = new AccountDAO();
//            Account account = accountDb.getAccountByID(id);
//            
//            if (account.isStatus() == true) {
//                accountDb.changeStatus(false, id);
//            }else{
//                accountDb.changeStatus(true, id);
//            }
//            response.sendRedirect("patient_details?account_id=" + id);
//        } catch (SQLException ex) {
//            Logger.getLogger(PatientDetailsControl.class.getName()).log(Level.SEVERE, null, ex);
//        }
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
