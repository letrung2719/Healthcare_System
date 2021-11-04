/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.doctor;

import dal.AppointmentDAO;
import java.io.IOException;

import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Appointment;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AppointmentDetailControl", urlPatterns = {"/appointmentDetailControl"})
public class AppointmentDetailControl extends HttpServlet {

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
           
            int appID = Integer.parseInt(request.getParameter("id"));
            String inputStatus = request.getParameter("status");
            AppointmentDAO appDb = new AppointmentDAO();
            Appointment a = appDb.getAppointmentByID(appID);

            if (inputStatus != null) {
                if (inputStatus.equals("cancel")) {
                    appDb.changeAppointmentStatus(a.getAppointmentID(), 0);
                }
                if (inputStatus.equals("pending")) {
                    appDb.changeAppointmentStatus(a.getAppointmentID(), 1);
                }
                if (inputStatus.equals("complete")) {
                    appDb.changeAppointmentStatus(a.getAppointmentID(), 2);
                }
                a = appDb.getAppointmentByID(appID);
                request.setAttribute("app", a);
                request.getRequestDispatcher("/doctor-role/appointment-detail.jsp").forward(request, response);
            }
            request.setAttribute("app", a);
            request.getRequestDispatcher("/doctor-role/appointment-detail.jsp").forward(request, response);
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
