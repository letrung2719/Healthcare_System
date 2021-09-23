package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Users;

public class SignUpControll extends HttpServlet {

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
        String user = request.getParameter("user");
        String phone = request.getParameter("phone");
        String pass = request.getParameter("pass");
        String name = request.getParameter("name");
        String gender_raw = request.getParameter("gender");
        int gender = gender_raw.equals("male")?1:0;
        String repass = request.getParameter("repass");
        String email = request.getParameter("email");

        int nphone = Integer.parseInt(phone);
        if (nphone <= 0) {
            request.setAttribute("mess", "phone not correct (>11 digit)");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
        int count = 0;
        if (nphone > 0) {
            nphone /= 10;
            count++;
        }
        if (!pass.equals(repass) && count <= 11) {
            request.setAttribute("mess", "repass not correct or phone not correct");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else {
            DAO dao = new DAO();
            Account a = dao.checkAccountExist(user);
            if (a == null) { //dc signup
                Account acc = new Account(count, user, pass);
                Users u = new Users(count, name, gender, "", phone, email);
                dao.insertNewAccount(acc);
                dao.insertNewUser(u);
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("mess", "existed!!!");
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
