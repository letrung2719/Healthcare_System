/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dal.ServicesDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Services;
import model.Specialities;

/**
 *
 * @author admin
 */
@WebServlet(name = "SearchServiceAdminControl", urlPatterns = {"/admin-role/search-service"})
public class SearchServiceAdminControl extends HttpServlet {

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
        
        try{
            String choice = request.getParameter("id");        
            String search = request.getParameter("txt");
            String[] arraySpec = request.getParameterValues("select_specialist");
            
            ServicesDAO dal = new ServicesDAO();
                    
            List<Services> listServices = dal.getAllServicesSearched(search);              
            List<String> listSpec = arraySpec == null ? new ArrayList<>() : Arrays.asList(arraySpec);
            List<Specialities> listSpecialities = dal.getAllSpecialities();
            List<Services> listServices1 = dal.searchSpecialities(listSpec);
            
            request.setAttribute("listServices", listServices);
            request.setAttribute("tim", search);
            request.setAttribute("listSpec", listSpecialities);
            request.setAttribute("listServices1", listServices1);                  
            request.getRequestDispatcher("service-list.jsp").forward(request, response);
        }catch(IOException | NumberFormatException | SQLException | ServletException e) {
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
