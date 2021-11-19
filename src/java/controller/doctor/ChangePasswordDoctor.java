/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.doctor;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ResourceBundle;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import utility.PasswordEncrypt;
import utility.Validate;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ChangePasswordDoctor", urlPatterns = {"/doctor-role/changePasswordDoctor"})
public class ChangePasswordDoctor extends HttpServlet {

    ResourceBundle resourceBundle = ResourceBundle.getBundle("resources/message");

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
        try {
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("acc");
            String oldPassword = request.getParameter("oldPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");

            request.setAttribute("oldPassword", oldPassword);
            request.setAttribute("confirmPassword", confirmPassword);
            request.setAttribute("newPassword", newPassword);

            AccountDAO accountDb = new AccountDAO();
            Validate validate = new Validate();
            int id = acc.getId();

            PasswordEncrypt encrypt = new PasswordEncrypt();
            if (!acc.getPass().equals(encrypt.generateEncryptedPassword(oldPassword))) {
                request.setAttribute("mess", resourceBundle.getString("invalid_pass"));
                request.getRequestDispatcher("change-password-doctor.jsp").forward(request, response);
            } else if (validate.checkPassword(newPassword) == false) {
                request.setAttribute("mess", resourceBundle.getString("password_requirement"));
                request.getRequestDispatcher("change-password-doctor.jsp").forward(request, response);
            } else if (!newPassword.equals(confirmPassword)) {
                request.setAttribute("mess", resourceBundle.getString("pass_not_matched"));
                request.getRequestDispatcher("change-password-doctor.jsp").forward(request, response);
            } else {
                accountDb.changePassword(encrypt.generateEncryptedPassword(newPassword), id);
                response.sendRedirect(request.getContextPath() + "/logout");
            }
        } catch (IOException | SQLException | ServletException ex) {
            System.out.println(ex);
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
