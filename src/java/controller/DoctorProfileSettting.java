/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.DoctorDAO;
import dal.PatientDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Doctor;
import model.Patients;

/**
 *
 * @author Admin
 */
public class DoctorProfileSettting extends HttpServlet {

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
            int accountID = Integer.parseInt(request.getParameter("accountID"));
            String name = request.getParameter("name");
            String gender_raw = request.getParameter("gender");
            int gender = gender_raw.equalsIgnoreCase("Male") ? 1 : 0;
            String dob = request.getParameter("dob");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String description = request.getParameter("description");
            Doctor d = new Doctor(doctorID, name, gender, dob, phone, email, "", null, description, "", accountID);
            System.out.println(d);
            DoctorDAO doctorDb = new DoctorDAO();
            int res = doctorDb.editDoctor(d);
            System.out.println(res);
            request.setAttribute("thongbao", "Edit success!");
            request.getRequestDispatcher("doctor_profile?id=" + accountID).forward(request, response);
        } catch (NumberFormatException ex) {
            System.out.println(ex);
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
