/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dal.ServicesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
@WebServlet(name = "ServiceListAdminControl", urlPatterns = {"/admin-role/service-list"})
public class ServiceListAdminControl extends HttpServlet {

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
            ServicesDAO dal = new ServicesDAO();
            List<Specialities> listSpecialities = dal.getAllSpecialities(); 
            List<Services> listServices = dal.getAllServices();
            int itemPerPage = 10;
            int page ;
            int pageNumber;
            String mpage = request.getParameter("page");
            if(mpage == null){
                page = 1;
            }else{
                page = Integer.parseInt(mpage);
            }
            pageNumber = listServices.size()/itemPerPage + (listServices.size()%itemPerPage==0?0:1);
            int start , end;
            start = (page-1)*itemPerPage;
            if(page*itemPerPage > listServices.size()){
                end = listServices.size();    
            }else {
                end = page*itemPerPage; 
            }
            List<Services> arr = dal.getServicesByPage(listServices, start, end);
            int length = arr.size();
            request.setAttribute("length", length);
            request.setAttribute("pageNumber", pageNumber);
            request.setAttribute("page", page);
            request.setAttribute("listSpec", listSpecialities); 
            request.setAttribute("listServices", arr); 
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
