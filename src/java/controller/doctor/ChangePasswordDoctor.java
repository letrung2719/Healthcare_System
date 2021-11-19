/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.doctor;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ChangePasswordDoctor", urlPatterns = {"/changePasswordDoctor"})
public class ChangePasswordDoctor extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePasswordDoctor</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePasswordDoctor at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String pattern = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\\S+$).{6,}";
        try {
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("acc");
            String oldPassword = request.getParameter("oldPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");
            
            AccountDAO accountDb = new AccountDAO();
            int id = acc.getId();
            if (!acc.getPass().equals(oldPassword)) {
                request.setAttribute("oldPassword", oldPassword);
                request.setAttribute("confirmPassword", confirmPassword);
                request.setAttribute("newPassword", newPassword);
                request.setAttribute("mess", "Invalid password");
                request.getRequestDispatcher("change-password-doctor.jsp").forward(request, response);
            } else if (!newPassword.matches(pattern)) {
                request.setAttribute("oldPassword", oldPassword);
                request.setAttribute("newPassword", newPassword);
                request.setAttribute("confirmPassword", confirmPassword);
                request.setAttribute("mess", "Password requires at least 6 characters, including at least 1 digit, 1 uppercase letter, 1 lowercase letter and no spaces.");
                request.getRequestDispatcher("change-password-doctor.jsp").forward(request, response);
            } else if (!newPassword.equals(confirmPassword)) {
                request.setAttribute("oldPassword", oldPassword);
                request.setAttribute("newPassword", newPassword);
                request.setAttribute("confirmPassword", confirmPassword);
                request.setAttribute("mess", "Confirm password not match");
                request.getRequestDispatcher("change-password-doctor.jsp").forward(request, response);
            } else {
                accountDb.changePassword(newPassword, id);
                session.removeAttribute("acc");
                request.setAttribute("success", "Change password success!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (Exception ex) {

        }
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
