/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import dbcontext.DBContext;
import java.sql.PreparedStatement;

import java.sql.SQLException;
import model.Reservation;

/**
 *
 * @author Admin
 */
public class ReservationDAO extends DBContext {
    PreparedStatement st = null;

    /**
     *
     * @param r
     * @return
     */
    public int addNewReservation(Reservation r) {
        String sql = "insert into Reservations (date,patient_id,service_id,price,slot_id,description,status) values (?,?,?,?,?,?,1)";
        try {
             st = connection.prepareStatement(sql);
            st.setString(1, r.getDate());
            st.setInt(2, r.getPatient().getPatientID());
            st.setInt(3, r.getService().getService_id());
            st.setDouble(4, r.getService().getPrice());
            st.setInt(5, r.getSlot().getSlotID());
            st.setString(6, r.getDescription());
            
            return st.executeUpdate();
        } catch (SQLException e) {

        }
        return 0;
    }
    
    /**
     *
     * @param args
     */
    public static void main(String[] args) {
        ReservationDAO db1 = new ReservationDAO();
        PatientDAO db2 = new PatientDAO();
        ServicesDAO db3 = new ServicesDAO();
        TimetableDAO db4 = new TimetableDAO();
        Reservation r = new Reservation("2021/10/15",
                db2.getPatientByPatientID(2),
                db3.getServiceByID("3"),
                db3.getServiceByID("3").getPrice(),
                db4.getTimeBySlotID(4),
                "");
        System.out.println(db1.addNewReservation(r));
    }
}
