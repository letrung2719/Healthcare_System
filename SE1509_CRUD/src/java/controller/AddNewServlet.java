/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.EmployeeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Employee;

/**
 *
 * @author TrungLT
 */
public class AddNewServlet extends HttpServlet {

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
            out.println("<title>Servlet AddNewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddNewServlet at " + request.getContextPath() + "</h1>");
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
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String dob = request.getParameter("dob");
            String g = request.getParameter("gender");
            boolean gender = g.equals("1");
            int salary = Integer.parseInt(request.getParameter("salary"));
            Employee e = new Employee(id, name, gender, dob, salary);

            EmployeeDAO db = new EmployeeDAO();

            //check employee existed
            if (db.getEmployeeById(id) != null) {
                request.setAttribute("error", id + " existed!");
                request.getRequestDispatcher("addNew.jsp").forward(request, response);
            } else {
                int rs = db.insert(e);
                if (rs > 0) {
                    request.getRequestDispatcher("list").forward(request, response);
                }
            }
        } catch (IOException | NumberFormatException | ServletException ex) {
            System.out.println(ex);
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
        String i = request.getParameter("id");
        int id = Integer.parseInt(i);
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String g = request.getParameter("gender");
        boolean gender = g.equals("1");
        String s = request.getParameter("salary");
        int salary = Integer.parseInt(s);
        Employee e = new Employee(id, name, gender, dob, salary);
        EmployeeDAO db = new EmployeeDAO();
        int rs = db.insert(e);
        request.getRequestDispatcher("list").forward(request, response);
//        response.sendRedirect("list");
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
