/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Student;

/**
 *
 * @author TrungLT
 */
public class StudentServlet extends HttpServlet {

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
            out.println("<title>Servlet StudentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StudentServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("formStudent.html").forward(request, response);
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
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet StudentServlet</title>");
        out.println("</head>");
        out.println("<body>");

        //lay tu form
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        String a = request.getParameter("age");
        try {
            int age = Integer.parseInt(a);
            String g = request.getParameter("gender").trim();
            boolean gender = g.equals("1");
            Student s = new Student(code, name, age, gender);
            // viet vao bang ve phia nguoi dung
            out.println("<table border=\"1px\" >\n"
                    + "<tr>\n"
                    + "<th>CODE</th>\n"
                    + "<th>NAME</th>\n"
                    + "<th>AGE</th>\n"
                    + "<th>GENDER</th>\n"
                    + "</tr>\n"
                    + "<tr>\n"
                    + "<td>" + s.getCode() + "</td>\n"
                    + "<td>" + s.getName() + "</td>\n"
                    + "<td>" + s.getAge() + "</td>\n"
                    + "<td>" + (s.isGender() ? "<img src=\"images/male-icon.png\"/>" : "<img src=\"images/female-icon.png\"/>") + "</td>\n"
                    + "</tr>\n"
                    + "</table>");
            out.println("<hr/> ");
        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        out.println("</body>");
        out.println("</html>");
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
