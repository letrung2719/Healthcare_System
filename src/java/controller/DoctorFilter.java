/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.DoctorDAO;
import dal.ServicesDAO;
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
public class DoctorFilter extends HttpServlet {
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
        String gender_raw = request.getParameter("gender_type");
        Integer gender = null;
        if (gender_raw != null) {
            gender = gender_raw.equalsIgnoreCase("Male") ? 1 : 0;
        }
        String[] arraySpec1 = request.getParameterValues("select_specialist");
        List<String> listSpec1 = arraySpec1 == null ? new ArrayList<>() : Arrays.asList(arraySpec1);
        ServicesDAO dao = new ServicesDAO();
        List<Specialities> listSpec = dao.getAllSpecialities();
        DoctorDAO doctorDb = new DoctorDAO();
        List<Doctor> listDoctors = doctorDb.search("", "", "", "", gender, listSpec1);
         int itemPerPage = 6;
        int page ;
        int pageNumber;
        String mpage = request.getParameter("page");
        if(mpage == null){
            page = 1;
        }else{
            page = Integer.parseInt(mpage);
        }
        pageNumber = listDoctors.size()/itemPerPage + (listDoctors.size()%itemPerPage==0?0:1);
        int start , end;
        start = (page-1)*itemPerPage;
        if(page*itemPerPage > listDoctors.size()){
            end = listDoctors.size();    
        }else {
            end = page*itemPerPage; 
        }
        List<Doctor> arr = doctorDb.getDoctorByPage(listDoctors, start, end);
        int length = arr.size();
        request.setAttribute("gender", gender);
        request.setAttribute("length", length);
        request.setAttribute("pageNumber", pageNumber);
        request.setAttribute("page", page);
        request.setAttribute("listDoctors", arr);
        request.setAttribute("listSpec", listSpec);
        request.setAttribute("listInputSpec", listSpec1);
        request.getRequestDispatcher("doctor.jsp").forward(request, response);
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
