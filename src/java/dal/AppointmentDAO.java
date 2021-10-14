/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Appointment;
import model.Doctor;
import model.Patient;

/**
 *
 * @author admin
 */
public class AppointmentDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public int addNewAppointment(Appointment a) {
        String sql = "insert into Appointments (patient_id,doctor_id,date,slot_id,description,status) values (?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getPatient().getPatientID());
            st.setInt(2, a.getDoctor().getDoctorID());
            st.setString(3, a.getDate());
            st.setInt(4, a.getSlot());
            st.setString(5, a.getDescription());
            st.setInt(6, a.getStatus());
            st.executeUpdate();
            return 1;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Appointment> getAllAppointment() {
        List<Appointment> list = new ArrayList<>();
        String sql = "select * from Appointments";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            PatientDAO dalPatient = new PatientDAO();
            DoctorDAO dalDoctor = new DoctorDAO();

            while (rs.next()) {
                Appointment a = new Appointment();
                a.setAppointmentID(rs.getInt(1));
                Patient p = dalPatient.getPatientByPatientID(rs.getInt(2));
                a.setPatient(p);
                Doctor d = dalDoctor.getDoctorByDoctorID(rs.getInt(3));
                a.setDoctor(d);
                a.setDate(rs.getString(4));
                a.setSlot(rs.getInt(5));
                a.setDescription(rs.getString(6));
                a.setStatus(rs.getInt(7));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        AppointmentDAO db = new AppointmentDAO();
        List<Appointment> list = db.getAllAppointment();
        for (Appointment a : list) {
            System.out.println(a.toString());
        }
    }
}
