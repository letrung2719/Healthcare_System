/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AccountDAO;
import dal.PatientDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Patient;
import utility.AccountVerification;
import utility.PasswordEncrypt;

/**
 *
 * @author admin
 */
@WebServlet(name = "AccountVerificationControl", urlPatterns = {"/account_verification"})
public class AccountVerificationControl extends HttpServlet {

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
            out.println("<title>Servlet AccountVerificationControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountVerificationControl at " + request.getContextPath() + "</h1>");
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
        try {
            String input = request.getParameter("send");
            String name = request.getParameter("name");
            int gender = Integer.parseInt(request.getParameter("gender"));
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            
            request.setAttribute("name", name);
            request.setAttribute("gender", gender);
            request.setAttribute("phone", phone);
            request.setAttribute("email", email);
            request.setAttribute("user", user);
            request.setAttribute("pass", pass);
            
            HttpSession session = request.getSession();
            String code = (String) session.getAttribute("code");

            if (input.equals(code)) {
                AccountDAO accountDb = new AccountDAO();
                PasswordEncrypt encryptedPass = new PasswordEncrypt();
                accountDb.insertNewAccountPatient(user, encryptedPass.generateEncryptedPassword(pass));

                PatientDAO patientDb = new PatientDAO();
                Patient p = new Patient(name, gender, null, phone, email, accountDb.getNewestAccount().getId(), "https://www.marketingmuses.com/wp-content/uploads/2018/01/invis-user.png");
                patientDb.insertNewPatient(p);

                request.setAttribute("success", resourceBundle.getString("account_verified_success"));
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("mess", resourceBundle.getString("invalid_verification_code"));
                request.getRequestDispatcher("account-verification.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountVerificationControl.class.getName()).log(Level.SEVERE, null, ex);
        }
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
            String email = (String) request.getAttribute("email");

            AccountVerification verify = new AccountVerification();
            String code = verify.getVerificationCode();
            verify.sendMail(email, code);

            HttpSession session = request.getSession();
            session.setAttribute("code", code);

            request.getRequestDispatcher("account-verification.jsp").forward(request, response);
        } catch (MessagingException ex) {
            Logger.getLogger(AccountVerificationControl.class.getName()).log(Level.SEVERE, null, ex);
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
