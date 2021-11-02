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
import model.Appointment;
import model.Doctor;
import model.Patient;
import model.Timetable;

/**
 *
 * @author admin
 */
public class AppointmentDAO {

    PreparedStatement ps = null;
    ResultSet rs = null;

    PatientDAO dalPatient = new PatientDAO();
    DoctorDAO dalDoctor = new DoctorDAO();
    TimetableDAO dalTimetable = new TimetableDAO();

    DBContext dbc = new DBContext();
    Connection connection = null;

    /**
     *
     * @param a
     * @return
     * @throws java.sql.SQLException
     */
    public int addNewAppointment(Appointment a) throws SQLException {
        String sql = "insert into Appointments (patient_id,doctor_id,date,slot_id,description,status) values (?,?,?,?,?,?)";

        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, a.getPatient().getPatientID());
            ps.setInt(2, a.getDoctor().getDoctorID());
            ps.setString(3, a.getDate());
            ps.setInt(4, a.getSlot().getSlotID());
            ps.setString(5, a.getDescription());
            ps.setInt(6, a.getStatus());
            ps.executeUpdate();
            return 1;
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
     * @param appID
     * @return
     * @throws java.sql.SQLException
     */
    public Appointment getAppointmentByID(int appID) throws SQLException {
        String sql = "select  * from appointments where appointment_id = " + appID;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {

                Appointment a = new Appointment();
                a.setAppointmentID(rs.getInt(1));
                Patient p = dalPatient.getPatientByPatientID(rs.getInt(2));
                a.setPatient(p);
                Doctor d = dalDoctor.getDoctorByDoctorID(rs.getInt(3));
                a.setDoctor(d);

                a.setDate(rs.getString(4));
                Timetable t = dalTimetable.getTimeBySlotID(rs.getInt(5));
                a.setSlot(t);
                a.setDescription(rs.getString(6));
                a.setStatus(rs.getInt(7));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return null;
    }

    /**
     *
     * @param doctorID
     * @return
     */
    public int getAllDoctorAppointment(int doctorID) throws SQLException {
        String sql = "select count(*) from Appointments where doctor_id = " + doctorID;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

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

    public int getAllPatientAppointment(int patientID) throws SQLException {
        String sql = "select count(*) from Appointments where patient_id = " + patientID;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

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
     * @return @throws java.sql.SQLException
     */
    public List<Appointment> getAppointmentAdmin() throws SQLException {
        List<Appointment> list = new ArrayList<>();
        String sql = "select * from Appointments";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Appointment a = new Appointment();
                a.setAppointmentID(rs.getInt(1));
                Patient p = dalPatient.getPatientByPatientID(rs.getInt(2));
                a.setPatient(p);
                Doctor d = dalDoctor.getDoctorByDoctorID(rs.getInt(3));
                a.setDoctor(d);
                a.setDate(rs.getString(4));
                Timetable s = dalTimetable.getTimeBySlotID(rs.getInt(5));
                a.setSlot(s);
                a.setDescription(rs.getString(6));
                a.setStatus(rs.getInt(7));
                list.add(a);
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
     * @param doctorID
     * @param start
     * @param numberOfItem
     * @return
     * @throws java.sql.SQLException
     */
    public List<Appointment> paginateAppointmentByDoctorID(int doctorID, int start, int numberOfItem) throws SQLException {
        List<Appointment> list = new ArrayList<>();
        String sql = "select * from appointments where doctor_id=" + doctorID + " order by appointment_id Limit " + numberOfItem + " offset " + start + ";";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Appointment a = new Appointment();
                a.setAppointmentID(rs.getInt(1));
                Patient p = dalPatient.getPatientByPatientID(rs.getInt(2));
                a.setPatient(p);
                Doctor d = dalDoctor.getDoctorByDoctorID(rs.getInt(3));
                a.setDoctor(d);
                a.setDate(rs.getString(4));

                Timetable slot = dalTimetable.getTimeBySlotID(rs.getInt(5));
                a.setSlot(slot);
                a.setDescription(rs.getString(6));
                a.setStatus(rs.getInt(7));
                list.add(a);
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
     * @param patientID
     * @param start
     * @param numberOfItem
     * @return
     * @throws SQLException
     */
    public List<Appointment> paginateAppointmentByPatientID(int patientID, int start, int numberOfItem) throws SQLException {
        List<Appointment> list = new ArrayList<>();
        String sql = "select * from appointments where patient_id=" + patientID + " order by appointment_id Limit " + numberOfItem + " offset " + start + ";";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Appointment a = new Appointment();
                a.setAppointmentID(rs.getInt(1));
                Patient p = dalPatient.getPatientByPatientID(rs.getInt(2));
                a.setPatient(p);
                Doctor d = dalDoctor.getDoctorByDoctorID(rs.getInt(3));
                a.setDoctor(d);
                a.setDate(rs.getString(4));

                Timetable slot = dalTimetable.getTimeBySlotID(rs.getInt(5));
                a.setSlot(slot);
                a.setDescription(rs.getString(6));
                a.setStatus(rs.getInt(7));
                list.add(a);
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
     * @param appID
     * @param status
     * @return
     * @throws java.sql.SQLException
     */
    public int changeAppointmentStatus(int appID, int status) throws SQLException {
        String sql = "update appointments set status = " + status + " where appointment_id  = " + appID;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            int i = ps.executeUpdate();
            return i;
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
     * @param d
     * @return
     * @throws java.sql.SQLException
     */
    public List<Appointment> getAllAppointmentByDoctorID(Doctor d) throws SQLException {
        List<Appointment> list = new ArrayList<>();
        String sql = "select * from Appointments where doctor_id = " + d.getDoctorID();
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Appointment a = new Appointment();
                a.setAppointmentID(rs.getInt(1));
                Patient p = dalPatient.getPatientByPatientID(rs.getInt(2));
                a.setPatient(p);
                a.setDoctor(d);
                a.setDate(rs.getString(4));
                Timetable slot = dalTimetable.getTimeBySlotID(rs.getInt(5));
                a.setSlot(slot);
                Timetable t = dalTimetable.getTimeBySlotID(rs.getInt(5));
                a.setSlot(t);
                a.setDescription(rs.getString(6));
                a.setStatus(rs.getInt(7));
                list.add(a);
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
     * @param appID
     * @return
     * @throws java.sql.SQLException
     */
    public int deleteAppointment(int appID) throws SQLException {
        String sql = "delete from appointments where appointment_id = " + appID;
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            return ps.executeUpdate();
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
            AppointmentDAO db = new AppointmentDAO();
            List<Appointment> list = db.paginateAppointmentByPatientID(1, 1, 1);
            System.out.println(list);
        } catch (SQLException ex) {
            Logger.getLogger(AppointmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
