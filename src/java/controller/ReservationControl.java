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
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.sql.SQLException;

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
import utility.Validate;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ReservationControl", urlPatterns = {"/reservation"})
public class ReservationControl extends HttpServlet {

    private static final long serialVersionUID = 9999L;
    ResourceBundle resourceBundle = ResourceBundle.getBundle("resources/message");

    private void writeObject(ObjectOutputStream stream)
            throws IOException {
        stream.defaultWriteObject();
    }

    private void readObject(ObjectInputStream stream)
            throws IOException, ClassNotFoundException {
        stream.defaultReadObject();
    }

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
        try {
            HttpSession session = request.getSession();
            Patient curUser = (Patient) session.getAttribute("user");
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
        } catch (IOException | SQLException | ServletException e) {
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
            String date = request.getParameter("date");

            String slotTime = request.getParameter("slotTime");
            String description = request.getParameter("description");
            int patientID = Integer.parseInt(request.getParameter("patientId"));
            String serviceId = request.getParameter("serviceID");
            int serviceID = Integer.parseInt(serviceId);
            PatientDAO patientDb = new PatientDAO();
            ServicesDAO serviceDb = new ServicesDAO();
            TimetableDAO slotDb = new TimetableDAO();
            
            Validate validate = new Validate();
            if (validate.checkDate(date) < 0) {
                Services s = serviceDb.getServiceByID(serviceId);
                request.setAttribute("mess", resourceBundle.getString("invalid_date"));
                request.setAttribute("service", s);
                request.getRequestDispatcher("reservation.jsp").forward(request, response);
            }
            Reservation r = new Reservation(date,
                    patientDb.getPatientByPatientID(patientID),
                    serviceDb.getServiceByID(serviceId),
                    serviceDb.getServiceByID(serviceId).getPrice(),
                    slotDb.getSlotByTime(slotTime),
                    description);

            ReservationDAO resDb = new ReservationDAO();

            int count = resDb.countDuplicateReservationByPatientID(patientID, serviceID, date, slotDb.getSlotByTime(slotTime).getSlotID());
            if (count > 0) {
                Services s = serviceDb.getServiceByID(serviceId);
                request.setAttribute("mess", "You had book this service");
                request.setAttribute("service", s);
                request.getRequestDispatcher("reservation.jsp").forward(request, response);
            } else {
                resDb.addNewReservation(r);
                request.setAttribute("reservation", r);
                request.getRequestDispatcher("reservation-success.jsp").forward(request, response);
            }

        } catch (NumberFormatException | SQLException e) {
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
