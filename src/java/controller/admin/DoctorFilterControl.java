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
        try {
            String doctorName = request.getParameter("name");
            String gender_raw = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String[] list = request.getParameterValues("select_specialist");
            
            Integer genderObj = new Integer("");
            if (gender_raw != null && !"".equals(gender_raw)) {
                int gender = gender_raw.equalsIgnoreCase("Male") ? 1 : 0;
                genderObj = gender;
            }
            System.out.println("==============================");
            System.out.println(list);
//            System.out.println(list1);
//            DoctorDAO doctorDb = new DoctorDAO();
//            List<Doctor> listDoctor = doctorDb.search(doctorName, dob, phone, email, genderObj, list1);
//            request.setAttribute("listDoctors", listDoctor);
//            SpecialitiesDAO dao = new SpecialitiesDAO();
//            List<Specialities> listSpec = dao.getAllSpecialities();
//            request.setAttribute("listSpec", listSpec);
//            request.getRequestDispatcher("doctor-list.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            
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
