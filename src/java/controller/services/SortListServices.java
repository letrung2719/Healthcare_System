package controller.services;

import dal.ServicesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Services;
import model.Specialities;

@WebServlet(name = "SortListServices", urlPatterns = {"/sortlistservices"})
public class SortListServices extends HttpServlet {

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
        String choice = request.getParameter("id");
        ServicesDAO dal = new ServicesDAO();
        if (choice.equals("0")) {
            String search = request.getParameter("txt");
            List<Services> listServices = dal.getAllServicesSearched(search);
            request.setAttribute("listServices", listServices);
            request.setAttribute("tim", search);
        }
        if (choice.equals("1")) {
            List<Services> listServices = dal.getAllServicesSortedUpPrice();
            request.setAttribute("listServices", listServices);
        }
        if (choice.equals("2")) {
            List<Services> listServices = dal.getAllServicesSortedDownPrice();
            request.setAttribute("listServices", listServices);
        }
        if (choice.equals("3")) {
            List<Services> listServices = dal.getAllServicesSortedSpecialities();
            request.setAttribute("listServices", listServices);
        }
        List<Specialities> listSpecialities = dal.getAllSpecialities();
        request.setAttribute("listSpecialities", listSpecialities);
        request.getRequestDispatcher("serviceslist.jsp").forward(request, response);
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
