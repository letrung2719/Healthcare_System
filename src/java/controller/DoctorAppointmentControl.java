/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AppointmentDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Appointment;

/**
 *
 * @author Admin
 */
public class DoctorAppointmentControl extends HttpServlet {
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
        int doctorID = Integer.parseInt(request.getParameter("doctorID"));
        String inputID = request.getParameter("deleteID");
        AppointmentDAO appDb = new AppointmentDAO();
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
        List<Appointment> listApp = appDb.paginateAppointmentByDoctorID(doctorID, indexPage, numberOfItem);
        if (inputID != null) {
            int appID = Integer.parseInt(inputID);
            int temp = appDb.deleteAppointment(appID);
            response.sendRedirect("doctorAppointmentControl?doctorID=" + doctorID);
        } else {
            request.setAttribute("listApp", listApp);
            request.setAttribute("indexPage", indexPage);
            request.setAttribute("numberOfPage", numberOfPage);
            request.getRequestDispatcher("/doctor/doctor-appointment.jsp").forward(request, response);
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
