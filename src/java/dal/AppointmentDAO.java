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
import model.Appointment;

/**
 *
 * @author admin
 */
public class AppointmentDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public int addNewAppointment(Appointment a) {
        String sql = "insert into Appointments (patient_id,doctor_id,date,slot_id,description) values (?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getPatient().getPatientID());
            st.setInt(2, a.getDoctor().getDoctorID());
            st.setString(3, a.getDate());
            st.setInt(4, a.getSlot());
            st.setString(5, a.getDescription());
            st.executeUpdate();
            return 1;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public static void main(String[] args) {
//        AppointmentDAO db = new AppointmentDAO();
//        db.addNewAppointment(1, 2, "2021-10-10", 2);
    }
}
