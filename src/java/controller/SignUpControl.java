package controller;

import dal.AccountDAO;

import dal.PatientDAO;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ResourceBundle;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utility.Validate;
import model.Account;
import model.Patient;

/**
 *
 * @author admin
 */
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
    public static final char SPACE = ' ';

    /**
     *
     */
    public static final char TAB = '\t';

    /**
     *
     */
    public static final char BREAK_LINE = '\n';

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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

        Validate validate = new Validate();
        if (validate.checkPhone(phone) == false) {
            request.setAttribute("mess", resourceBundle.getString("invalid_phone"));
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }

        if (!pass.equals(repass)) {
            request.setAttribute("mess", resourceBundle.getString("pass_not_matched"));

            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else {
            PatientDAO patientDb = new PatientDAO();
            AccountDAO accountDb = new AccountDAO();
            Account a = accountDb.checkAccountExist(user);
            if (a == null) { //Account a chua ton tai
                accountDb.insertNewAccountPatient(user, pass);
                Account account = accountDb.getNewestAccount();
                Patient u = new Patient(name, gender, "", phone, email, account.getId(), "");
                patientDb.insertNewPatient(u);
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("mess", resourceBundle.getString("existed_account"));
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
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
