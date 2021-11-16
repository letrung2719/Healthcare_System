/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AppointmentDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Appointment;

/**
 *
 * @author admin
 */
@WebServlet(name = "AppointmentHistoryControl", urlPatterns = {"/appointment-history"})
public class AppointmentHistoryControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        try{
            int patientID = Integer.parseInt(request.getParameter("id"));
            AppointmentDAO appDb = new AppointmentDAO();
            int indexPage;
            String getInputPage = request.getParameter("page");
            if (getInputPage == null) {
                indexPage = 1;
            } else {
                indexPage = Integer.parseInt(getInputPage);
            }
            int totalAppointment = appDb.getAllPatientAppointment(patientID);
            int numberOfItem = 5;
            int numberOfPage = totalAppointment / numberOfItem + (totalAppointment % numberOfItem == 0 ? 0 : 1);
            int start = (indexPage - 1) * numberOfItem;
            List<Appointment> listApp = appDb.paginateAppointmentByPatientID(patientID, start, numberOfItem);
            
            request.setAttribute("listApp", listApp);
            request.setAttribute("indexPage", indexPage);
            request.setAttribute("numberOfPage", numberOfPage);
            request.getRequestDispatcher("appointment-history.jsp").forward(request, response);
        } catch (IOException | NumberFormatException | ServletException e) {
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AppointmentHistoryControl.class.getName()).log(Level.SEVERE, null, ex);
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
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AppointmentHistoryControl.class.getName()).log(Level.SEVERE, null, ex);
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
