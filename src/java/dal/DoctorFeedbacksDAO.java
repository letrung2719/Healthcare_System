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
import model.Doctor;
import model.DoctorFeedbacks;
import model.Patient;

/**
 *
 * @author admin
 */
public class DoctorFeedbacksDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;
    PatientDAO patientDB = new PatientDAO();
    DoctorDAO doctorDB = new DoctorDAO();

    public int addNewDoctorFeedback(DoctorFeedbacks feedback) {
        String sql = "insert into Doctor_Feedbacks (date,content,rate,patient_id,doctor_id) values (?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, feedback.getDate());
            ps.setString(2, feedback.getContent());
            ps.setInt(3, feedback.getRate());
            ps.setInt(4, feedback.getPatient().getPatientID());
            ps.setInt(5, feedback.getDoctor().getDoctorID());
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<DoctorFeedbacks> getAllDoctorFeedbacks(int doctorID) {
        List<DoctorFeedbacks> list = new ArrayList<>();
        String sql = "select * from Doctor_Feedbacks where doctor_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, doctorID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new DoctorFeedbacks(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), patientDB.getPatientByPatientID(rs.getInt(5)), doctorDB.getDoctorByDoctorID(rs.getInt(6))));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int getAverageRating(int doctorID) {
        DoctorFeedbacksDAO doctorFeedbackDAO = new DoctorFeedbacksDAO();
        List<DoctorFeedbacks> list = doctorFeedbackDAO.getAllDoctorFeedbacks(doctorID);
        int sum = 0;
        for (DoctorFeedbacks feedbacks : list) {
            sum += feedbacks.getRate();
        }
        if (sum == 0) {
            return 0;
        } else {
            return sum / list.size();
        }

    }

    public int deleteDoctorFeedback(int patientID, int doctorID) {
        String sql = "delete from Doctor_Feedbacks where patient_id = ? and doctor_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, patientID);
            ps.setInt(2, doctorID);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int countAllDoctorFeedback(int doctorID) {
        String sql = "select count(*) from Doctor_Feedbacks where doctor_id = " + doctorID;
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

    public List<DoctorFeedbacks> paginateDoctorFeedbackByDoctorID(int doctorID, int pageNumber, int numberOfItem, String sort) {
        List<DoctorFeedbacks> list = new ArrayList<>();
        String sql = "DECLARE @PageNumber AS INT\n"
                + "DECLARE @RowsOfPage AS INT\n"
                + "SET @PageNumber=" + pageNumber + "\n"
                + "SET @RowsOfPage=" + numberOfItem + "\n"
                + "SELECT * FROM Doctor_Feedbacks where doctor_id=" + doctorID + "\n"
                + "ORDER BY " + sort + "\n"
                + "OFFSET (@PageNumber-1)*@RowsOfPage ROWS\n"
                + "FETCH NEXT @RowsOfPage ROWS ONLY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                DoctorFeedbacks df = new DoctorFeedbacks();
                df.setFeedbackID(rs.getInt(1));
                df.setDate(rs.getString(2));
                df.setContent(rs.getString(3));
                df.setRate(rs.getInt(4));
                Patient p = patientDB.getPatientByPatientID(rs.getInt(5));
                Doctor d = doctorDB.getDoctorByDoctorID(rs.getInt(6));
                df.setPatient(p);
                df.setDoctor(d);
                list.add(df);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        DoctorFeedbacksDAO db = new DoctorFeedbacksDAO();
//        Patient patient = new Patient(1, "abc", 0, "", "", "", 2, "");
//        Doctor doctor = new Doctor(5, "", 0, "", "", "", "", null, "", "", 1);
//        DoctorFeedbacks feedback = new DoctorFeedbacks("2021-11-21", "abcacfa", 4, patient, doctor);
//        db.addNewDoctorFeedback(feedback);

//        System.out.println(db.getAverageRating(2));
        List<DoctorFeedbacks> list = db.paginateDoctorFeedbackByDoctorID(1, 1, 5, "feedback_id");
        System.out.println(list);
    }

}
