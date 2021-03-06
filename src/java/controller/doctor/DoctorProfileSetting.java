/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.doctor;

import dal.DoctorDAO;
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
import model.Doctor;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DoctorProfileSettting", urlPatterns = {"/doctor-role/doctor_profile_setting"})
public class DoctorProfileSetting extends HttpServlet {
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
            HttpSession session = request.getSession();
            Doctor editedDoctor = doctorDb.getDoctorByDoctorID(doctorID);
            session.setAttribute("user", editedDoctor);
            request.setAttribute("thongbao", resourceBundle.getString("success"));
            request.getRequestDispatcher("/doctor-role/doctor_profile?id=" + accountID).forward(request, response);
        } catch (NumberFormatException | SQLException ex) {
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
