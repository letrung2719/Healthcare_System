/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.PatientDAO;
import dal.ReservationDAO;
import dal.ServicesDAO;
import dal.TimetableDAO;
import java.io.IOException;
import java.util.ResourceBundle;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Patient;
import model.Reservation;
import model.Services;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ReservationControl", urlPatterns = {"/reservation"})
public class ReservationControl extends HttpServlet {

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
        HttpSession session = request.getSession();
        Patient curUser = (Patient) session.getAttribute("acc");
        if (curUser == null) {
            request.setAttribute("mess", resourceBundle.getString("must_login"));
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            String serviceId = request.getParameter("id");
            ServicesDAO serviceDb = new ServicesDAO();
            Services s = serviceDb.getServiceByID(serviceId);
            request.setAttribute("service", s);
            request.getRequestDispatcher("reservation.jsp").forward(request, response);
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
            String date = request.getParameter("date");
            int slot_id = Integer.parseInt(request.getParameter("slot_id"));
            String description = request.getParameter("description");
            int patientID = Integer.parseInt(request.getParameter("patientId"));
            String serviceId = request.getParameter("serviceID");

//            Reservation(String date, Patient patient, Services service, double price, Timetable slot, String description)
            PatientDAO patientDb = new PatientDAO();
            ServicesDAO serviceDb = new ServicesDAO();
            TimetableDAO slotDb = new TimetableDAO();
            Reservation r = new Reservation(date,
                    patientDb.getPatientByPatientID(patientID),
                    serviceDb.getServiceByID(serviceId),
                    serviceDb.getServiceByID(serviceId).getPrice(),
                    slotDb.getTimeBySlotID(slot_id),
                    description);
            ReservationDAO resDb = new ReservationDAO();
            resDb.addNewReservation(r);

            request.setAttribute("reservation", r);
            request.getRequestDispatcher("reservation-success.jsp").forward(request, response);

        } catch (NumberFormatException e) {

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
