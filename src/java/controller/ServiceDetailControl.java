/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.ServicesDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Patient;
import model.ServiceFeedbacks;
import model.Services;
import model.Specialities;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ServiceDetailControl", urlPatterns = {"/serdetail"})
public class ServiceDetailControl extends HttpServlet {

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
        try {
            String id = request.getParameter("sid");
            ServicesDAO dao = new ServicesDAO();

            Services s = dao.getServiceByID(id);
            String specID = s.getType_id();

            int avrate = dao.averageRateServices(id);
            Specialities spec = dao.getSpecByID(specID);
            String type_id = dao.getServiceByID(id).getType_id();
            List<Services> listS = dao.getTop4Last(type_id);
            List<ServiceFeedbacks> listF = dao.getAllComment(id);
            int totalfeedback = listF.size();

            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("acc");

            if (a != null) {
                if (a.getAuthor_id() == 2) {
                    Patient p = (Patient) session.getAttribute("user");
                    List<ServiceFeedbacks> check = dao.checkPatientComment((int) p.getPatientID(), id);
                    if (check.isEmpty()) {
                        request.setAttribute("check", 1);
                    } else {
                        request.setAttribute("check", 5);
                    }
                }
            }

            request.setAttribute("avrate", avrate);
            request.setAttribute("totalfeedback", totalfeedback);
            request.setAttribute("detail", s);
            request.setAttribute("spec", spec);
            request.setAttribute("listS", listS);
            request.setAttribute("listF", listF);
            request.getRequestDispatcher("service-detail.jsp").forward(request, response);
        } catch (IOException | SQLException | ServletException e) {
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
