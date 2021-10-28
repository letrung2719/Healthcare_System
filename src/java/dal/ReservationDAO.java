/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import dbcontext.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Reservation;

/**
 *
 * @author Admin
 */
public class ReservationDAO {

    PreparedStatement st = null;
    ResultSet rs = null;
    
    DBContext dbc = new DBContext();
    Connection connection = null;

    /**
     *
     * @param r
     * @return
     */
    public int addNewReservation(Reservation r) throws SQLException {
        String sql = "insert into Reservations (date,patient_id,service_id,price,slot_id,description,status) values (?,?,?,?,?,?,1)";
        try {
            connection = dbc.getConnection();
            st = connection.prepareStatement(sql);
            st.setString(1, r.getDate());
            st.setInt(2, r.getPatient().getPatientID());
            st.setInt(3, r.getService().getService_id());
            st.setDouble(4, r.getService().getPrice());
            st.setInt(5, r.getSlot().getSlotID());
            st.setString(6, r.getDescription());

            return st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return 0;
    }

    public int countDuplicateReservationByPatientID(int patientID, int serviceID) throws SQLException {

        String sql = "SELECT\n"
                + "   COUNT(*)\n"
                + "FROM\n"
                + "    reservations r\n"
                + "where \n"
                + "	patient_id=" + patientID + " and service_id=" + serviceID + "\n"
                + "GROUP BY\n"
                + "    r.date, r.slot_id, r.patient_id";
        try {
            connection = dbc.getConnection();
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return 0;
    }

    /**
     *
     * @param args
     */
    public static void main(String[] args) {
        try {
            ReservationDAO db1 = new ReservationDAO();
            PatientDAO db2 = new PatientDAO();
            ServicesDAO db3 = new ServicesDAO();
            TimetableDAO db4 = new TimetableDAO();
            Reservation r = new Reservation("2021/10/15", db2.getPatientByPatientID(2), db3.getServiceByID("3"), db3.getServiceByID("3").getPrice(), db4.getTimeBySlotID(4), "");
            System.out.println(db1.addNewReservation(r));
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
