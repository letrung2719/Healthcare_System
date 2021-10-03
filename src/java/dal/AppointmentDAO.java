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

/**
 *
 * @author admin
 */
public class AppointmentDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public int addNewAppointment(int patientID, int doctorID, String date, int slot_id) {
        String sql = "insert into Appointments (patient_id,doctor_id,date,slot_id) values (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, patientID);
            st.setInt(2, doctorID);
            st.setString(3, date);
            st.setInt(4, slot_id);
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


