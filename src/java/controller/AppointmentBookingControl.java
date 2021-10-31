/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AppointmentDAO;
import dal.DoctorDAO;
import dal.PatientDAO;
import dal.TimetableDAO;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.ResourceBundle;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Appointment;
import model.Doctor;

/**
 *
 * @author admin
 */
@WebServlet(name = "AppointmentBookingControl", urlPatterns = {"/booking"})
public class AppointmentBookingControl extends HttpServlet {
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AppointmentBookingControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AppointmentBookingControl at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        
        if (acc == null) {
            request.setAttribute("mess", resourceBundle.getString("must_login"));
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            try {
                int account_id = Integer.parseInt(request.getParameter("account_id"));
                DoctorDAO db = new DoctorDAO();
                Doctor d = db.getDoctorByAccountID(account_id);

                request.setAttribute("doctor", d);
                request.getRequestDispatcher("booking.jsp").forward(request, response);
            } catch (SQLException ex) {
                System.out.println(ex);
            }
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
            int patient_id = Integer.parseInt(request.getParameter("patient_id"));
            int doctor_id = Integer.parseInt(request.getParameter("doctor_id"));
            String date = request.getParameter("date");
            int slot_id = Integer.parseInt(request.getParameter("slot_id"));
            String description = request.getParameter("description");

            PatientDAO db1 = new PatientDAO();
            DoctorDAO db2 = new DoctorDAO();
            TimetableDAO db3 = new TimetableDAO();
            AppointmentDAO db4 = new AppointmentDAO();

            Appointment a = new Appointment(db1.getPatientByPatientID(patient_id), db2.getDoctorByDoctorID(doctor_id), date, db3.getTimeBySlotID(slot_id), description, 1);

            List<Appointment> list = db4.getAllAppointmentByDoctorID(db2.getDoctorByDoctorID(doctor_id));
            
            for (Appointment appointment : list) {
                if (a.getDate().equals(appointment.getDate())) {
                    System.out.println(appointment.toString());
                    if (a.getSlot().getSlotID() == appointment.getSlot().getSlotID()) {
                        request.setAttribute("mess", resourceBundle.getString("slot_busy"));
                        request.setAttribute("doctor", db2.getDoctorByDoctorID(doctor_id));
                        request.setAttribute("date", date);
                        request.getRequestDispatcher("booking.jsp").forward(request, response);
                    }
                }
            }
            request.setAttribute("appointment", a);
            request.getRequestDispatcher("booking-confirm.jsp").forward(request, response);
        } catch (SQLException ex) {
            System.out.println(ex);
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
