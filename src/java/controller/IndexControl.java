package controller;

import dal.DoctorDAO;
import dal.ServicesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Doctor;
import model.Specialities;

@WebServlet(name = "IndexControl", urlPatterns = {"/home"})
public class IndexControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            DoctorDAO doctorDb = new DoctorDAO();
        ServicesDAO dao = new ServicesDAO();
        List<Specialities> listSpec = dao.getAllSpecialities();
        List<Doctor> list = doctorDb.getAllDoctor();
        
        request.setAttribute("listDoctors", list);
        request.setAttribute("listSpec", listSpec);
        request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
