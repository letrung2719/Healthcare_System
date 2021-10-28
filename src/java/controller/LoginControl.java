package controller;

import dal.AccountDAO;
import dal.DoctorDAO;
import dal.PatientDAO;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.sql.SQLException;
import java.util.ResourceBundle;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Doctor;
import model.Patient;

/**
 *
 * @author admin
 */
public class LoginControl extends HttpServlet {

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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String user = request.getParameter("username");
            String pass = request.getParameter("password");
            AccountDAO accountDb = new AccountDAO();
            Account a = accountDb.login(user, pass);
            PatientDAO patientDb = new PatientDAO();
            DoctorDAO doctorDb = new DoctorDAO();

            request.setAttribute("username", user);

            HttpSession session = request.getSession();
            if (a == null) {
                request.setAttribute("mess", resourceBundle.getString("invalid_account"));
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                session.setAttribute("acc", a);
                switch (a.getAuthor_id()) {
                    case 1:
                        Doctor d = doctorDb.getDoctorByAccountID(a.getId());
                        session.setAttribute("user", d);
                        request.getRequestDispatcher("doctor-role/doctor-appointment.jsp").forward(request, response);
                        break;
                    case 2:
                        Patient p = patientDb.getPatientByAccountID(a.getId());
                        session.setAttribute("user", p);
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                        break;
                    case 0:
                        response.sendRedirect("admin-role/index.jsp");
                        break;
                }
            }
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
