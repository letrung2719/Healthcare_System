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
import java.util.ArrayList;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Patient;

import model.Reservation;
import model.Services;
import model.Timetable;

/**
 *
 * @author Admin
 */
public class ReservationDAO {

    PreparedStatement st = null;
    ResultSet rs = null;

    DBContext dbc = new DBContext();
    Connection connection = null;

    PatientDAO patientDb = new PatientDAO();
    ServicesDAO serviceDb = new ServicesDAO();
    TimetableDAO slotDb = new TimetableDAO();

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

    public int countDuplicateReservationByPatientID(int patientID, int serviceID, String date, int slotID) throws SQLException {

        String sql = "select count(*) from reservations where patient_id = " + patientID + " and service_id= " + serviceID + " and date = '" + date + "' and slot_id = " + slotID + " ;";
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

    public List<Reservation> getReservationByPationIdAndPage(int patientID, int start, int numberOfItem) throws SQLException {
        List<Reservation> list = new ArrayList<>();
        String sql = "select * from reservations where patient_id=" + patientID + " order by reservation_id Limit " + numberOfItem + " offset " + start + ";";
        try {

            connection = dbc.getConnection();
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Reservation r = new Reservation();
                r.setReservationID(rs.getInt(1));
                r.setDate(rs.getString(2));
                Patient p = patientDb.getPatientByPatientID(rs.getInt(3));
                Services s = serviceDb.getServiceByID(rs.getString(4));
                r.setPatient(p);
                r.setService(s);
                r.setPrice(rs.getDouble(5));
                r.setStatus(rs.getInt(6));
                Timetable slot = slotDb.getTimeBySlotID(rs.getInt(7));
                r.setSlot(slot);
                r.setDescription(rs.getString(8));
                list.add(r);

            }
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return list;
    }

    public int totalReservationByPatient(int patientId) throws SQLException {
        String sql = "select count(*) from reservations where patient_id = " + patientId;
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

    public List<Reservation> getAllReservation() throws SQLException {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM reservations";
        try {
            connection = dbc.getConnection();
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Reservation r = new Reservation();
                r.setReservationID(rs.getInt(1));
                r.setDate(rs.getString(2));
                Patient p = patientDb.getPatientByPatientID(rs.getInt(3));
                r.setPatient(p);
                Services se = serviceDb.getServiceByID(rs.getString(4));
                r.setService(se);
                r.setPrice(rs.getDouble(5));
                r.setStatus(rs.getInt(6));
                Timetable t = slotDb.getTimeBySlotID(rs.getInt(7));
                r.setSlot(t);
                r.setDescription(rs.getString(8));
                list.add(r);
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return list;
    }

    /**
     *
     * @param args
     */
    public static void main(String[] args) {
        try {
            ReservationDAO db1 = new ReservationDAO();
//            PatientDAO db2 = new PatientDAO();
//            ServicesDAO db3 = new ServicesDAO();
//            TimetableDAO db4 = new TimetableDAO();
//            Reservation r = new Reservation("2021/10/15", db2.getPatientByPatientID(2), db3.getServiceByID("3"), db3.getServiceByID("3").getPrice(), db4.getTimeBySlotID(4), "");
//            System.out.println(db1.addNewReservation(r));
//            List<Reservation> list = db1.getReservationByPationIdAndPage(1, 0, 4);
            List<Reservation> lists = db1.getAllReservation();
            System.out.println(lists);
//            System.out.println(db1.totalReservationByPatient(1));
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
