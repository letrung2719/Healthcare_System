package controller.admin;

import dal.AppointmentDAO;
import dal.DoctorDAO;
import dal.PatientDAO;
import dal.ReservationDAO;
import dal.ServicesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Appointment;
import model.Doctor;
import model.Patient;
import model.Specialities;

@WebServlet(name = "AdminHomeControl", urlPatterns = {"/admin-role/admin-home"})
public class AdminHomeControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            PatientDAO patientDb = new PatientDAO();
            int patientNumber = patientDb.getAllPatient().size();
            List<Patient> patientHomeAdmin = new ArrayList<>();
            for (int i = 1; i <= patientNumber; i++) {
                Patient p = patientDb.getPatientByPatientIdForAdmin(i);
                if (p.getAccountID() != 0) {
                    patientHomeAdmin.add(p);
                }
            }
            while (patientHomeAdmin.size() > 6) {
                int index = patientHomeAdmin.size() -1;
                patientHomeAdmin.remove(index);
            } //giới hạn list xuống còn 6 phần tử
            
            ReservationDAO rdao = new ReservationDAO();
            int moneyNumber = rdao.sumMoney();

            DoctorDAO doctorDb = new DoctorDAO();
            int doctorNumber = doctorDb.getAllDoctor().size();
            List<Doctor> listD = doctorDb.getAllDoctor();
            while (listD.size() > 6) {
                int index = listD.size() -1;
                listD.remove(index);
            } //giới hạn list xuống còn 6 phần tử
            
            AppointmentDAO dao = new AppointmentDAO();
            int appointmentNumber = dao.getAppointmentAdmin().size();
            List<Appointment> listA = dao.getAppointmentAdmin();
            while (listA.size() > 6) {
                int index = listA.size() -1;
                listA.remove(index);
            } //giới hạn list xuống còn 6 phần tử

            request.setAttribute("patientNumber", patientNumber);
            request.setAttribute("doctorNumber", doctorNumber);
            request.setAttribute("appointmentNumber", appointmentNumber);
            request.setAttribute("moneyNumber", moneyNumber);

            request.setAttribute("patientHomeAdmin", patientHomeAdmin);
            request.setAttribute("doctorHomeAdmin", listD);
            request.setAttribute("listA", listA);
            request.getRequestDispatcher("/admin-role/index.jsp").forward(request, response);
        } catch (IOException | ServletException | SQLException e) {
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
