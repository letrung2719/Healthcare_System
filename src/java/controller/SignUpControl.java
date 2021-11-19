package controller;

import dal.AccountDAO;
import dal.PatientDAO;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utility.Validate;

/**
 *
 * @author admin
 */
@WebServlet(name = "SignUpControl", urlPatterns = {"/signup"})
public class SignUpControl extends HttpServlet {

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
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String pattern = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\\S+$).{6,}";
        try {
            String name = request.getParameter("name");
            int gender = Integer.parseInt(request.getParameter("gender"));
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            String repass = request.getParameter("repass");

            request.setAttribute("name", name);
            request.setAttribute("gender", gender);
            request.setAttribute("phone", phone);
            request.setAttribute("email", email);
            request.setAttribute("user", user);
            request.setAttribute("pass", pass);
            request.setAttribute("repass", repass);

            AccountDAO accountDb = new AccountDAO();
            PatientDAO patientDb = new PatientDAO();
            Validate validate = new Validate();
            if (validate.checkPhone(phone) == false) {
                // check validate phone number
                request.setAttribute("mess", resourceBundle.getString("invalid_phone"));
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            } else if (accountDb.checkAccountExist(user) != null) {
                // check account existed
                request.setAttribute("mess", resourceBundle.getString("existed_account"));
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            } else if (patientDb.checkEmailExisted(email) != null) {
                // check email existed
                request.setAttribute("mess", resourceBundle.getString("existed_email"));
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            } else if (!pass.equals(repass)) {
                // check pass and repass matched
                request.setAttribute("mess", resourceBundle.getString("pass_not_matched"));
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            } else if (validate.checkPassword(pass) == false) {
                // validate password
                request.setAttribute("mess", resourceBundle.getString("password_requirement"));
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("account_verification").forward(request, response);
            }
        } catch (IOException | NumberFormatException | SQLException | ServletException e) {
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SignUpControl.class.getName()).log(Level.SEVERE, null, ex);
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
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SignUpControl.class.getName()).log(Level.SEVERE, null, ex);
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
