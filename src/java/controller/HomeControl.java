package controller;

import dal.DoctorDAO;
import dal.ServicesDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Doctor;
import model.Services;
import model.Specialities;

@WebServlet(name = "HomeControl", urlPatterns = {"/home"})
public class HomeControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            DoctorDAO doctorDb = new DoctorDAO();
        ServicesDAO dao = new ServicesDAO();
        List<Services> listSer = dao.getTop10BestService();
        List<Specialities> listSpec = dao.getAllSpecialities();
        List<Doctor> list = doctorDb.getTop10BestDoctor();
        
        request.setAttribute("listDoctors", list);
        request.setAttribute("listSpec", listSpec);
        request.setAttribute("listSer", listSer);
        request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (IOException | SQLException | ServletException e) {
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