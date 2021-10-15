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
import model.Timetable;

/**
 *
 * @author admin
 */
public class AppointmentDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    PatientDAO dalPatient = new PatientDAO();
    DoctorDAO dalDoctor = new DoctorDAO();
    TimetableDAO dalTimetable = new TimetableDAO();

    public int addNewAppointment(Appointment a) {
        String sql = "insert into Appointments (patient_id,doctor_id,date,slot_id,description,status) values (?,?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getPatient().getPatientID());
            st.setInt(2, a.getDoctor().getDoctorID());
            st.setString(3, a.getDate());
            st.setInt(4, a.getSlot().getSlotID());
            st.setString(5, a.getDescription());
            st.setInt(6, a.getStatus());
            st.executeUpdate();
            return 1;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public Appointment getAppointmentByID(int appID) {
        String sql = "select  * from appointments where appointment_id = " + appID;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            rs = st.executeQuery();

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

        }
        return null;
    }

    public int getAllDoctorAppointment(int doctorID) {
        String sql = "select count(*) from Appointments where doctor_id = " + doctorID;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Appointment> paginateAppointmentByDoctorID(int doctorID, int pageNumber, int numberOfItem) {
        List<Appointment> list = new ArrayList<>();
        String sql = "DECLARE @PageNumber AS INT\n"
                + "DECLARE @RowsOfPage AS INT\n"
                + "SET @PageNumber=?\n"
                + "SET @RowsOfPage=?\n"
                + "SELECT * FROM Appointments where doctor_id =?\n"
                + "ORDER BY appointment_id \n"
                + "OFFSET (@PageNumber-1)*@RowsOfPage ROWS\n"
                + "FETCH NEXT @RowsOfPage ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pageNumber);
            ps.setInt(2, numberOfItem);
            ps.setInt(3, doctorID);
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
        }
        return list;
    }

    public int changeAppointmentStatus(int appID, int status) {
        String sql = "update appointments set status = " + status + " where appointment_id  = " + appID;
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            int rs = st.executeUpdate();
            return rs;
        }catch(SQLException e){
            
        }
        return 0;
    }
    
    public List<Appointment> getAllAppointmentByDoctorID(Doctor d) {
        List<Appointment> list = new ArrayList<>();
        String sql = "select * from Appointments where doctor_id = " + d.getDoctorID();
        try {
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

        }
        return list;
    }
    public int deleteAppointment(int appID){
        String sql = "delete appointments where appointment_id ="+ appID;
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            return st.executeUpdate();
        }catch(SQLException e){
            
        }
        return 0;
    }
    public static void main(String[] args) {
        AppointmentDAO db = new AppointmentDAO();
//        Doctor d = new Doctor(1, "name", 0, "", "0123456789", "abc@gamil.com", null, null, "", "", 1);
//        List<Appointment> list = db.getAllAppointmentByDoctorID(d);
//        for (Appointment a : list) {
//            System.out.println(a.toString());
//        }
        System.out.println(db.deleteAppointment(12));
    }
}
