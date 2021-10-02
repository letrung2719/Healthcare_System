/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dal.DoctorDAO;
import dal.SpecialitiesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Doctor;
import model.Specialities;

/**
 *
 * @author Admin
 */
public class DoctorFilterControl extends HttpServlet {

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
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String gender_raw = request.getParameter("gender");
        Integer gender = null;
        if (gender_raw != null) {
            gender = gender_raw.equalsIgnoreCase("Male") ? 1 : 0;
        }
        String dob = request.getParameter("dob");
        String email = request.getParameter("email");
        String[] arraySpec1 = request.getParameterValues("select_specialist");
        List<String> listSpec1 = arraySpec1 == null ? new ArrayList<>() : Arrays.asList(arraySpec1);
         SpecialitiesDAO dao = new SpecialitiesDAO();
        List<Specialities> listSpec = dao.getAllSpecialities();
        DoctorDAO doctorDb = new DoctorDAO();
        List<Doctor> listDoctors = doctorDb.search(name, dob, phone , email, gender, listSpec1);
        request.setAttribute("listDoctors", listDoctors);
        request.setAttribute("listSpec", listSpec);
        request.getRequestDispatcher("doctor-list.jsp").forward(request, response);
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
