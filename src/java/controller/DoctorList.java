/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.DoctorDAO;
import dal.DoctorFeedbacksDAO;
import dal.ServicesDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Doctor;
import model.DoctorFeedbacks;
import model.Specialities;

/**
 *
 * @author Admin
 */
public class DoctorList extends HttpServlet {
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
        DoctorDAO doctorDb = new DoctorDAO();
        ServicesDAO dao = new ServicesDAO();
        List<Specialities> listSpec = dao.getAllSpecialities();
        List<Doctor> list = doctorDb.getAllDoctor();
        int itemPerPage = 6;
        int page ;
        int pageNumber;
        String mpage = request.getParameter("page");
        if(mpage == null){
            page = 1;
        }else{
            page = Integer.parseInt(mpage);
        }
        pageNumber = list.size()/itemPerPage + (list.size()%itemPerPage==0?0:1);
        int start , end;
        start = (page-1)*itemPerPage;
        if(page*itemPerPage > list.size()){
            end = list.size();    
        }else {
            end = page*itemPerPage; 
        }
        List<Doctor> arr = doctorDb.getDoctorByPage(list, start, end);
        int length = arr.size();
        request.setAttribute("length", length);
        request.setAttribute("pageNumber", pageNumber);
        request.setAttribute("page", page);
        request.setAttribute("listDoctors", arr);
        request.setAttribute("listSpec", listSpec);
        
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
