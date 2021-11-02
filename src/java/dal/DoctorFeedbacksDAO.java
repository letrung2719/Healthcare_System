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
import model.Doctor;
import model.DoctorFeedbacks;
import model.Patient;

/**
 *
 * @author admin
 */
public class DoctorFeedbacksDAO {

    PreparedStatement ps = null;
    ResultSet rs = null;
    PatientDAO patientDB = new PatientDAO();
    DoctorDAO doctorDB = new DoctorDAO();

    DBContext dbc = new DBContext();
    Connection connection = null;

    /**
     *
     * @param feedback
     * @return
     * @throws java.sql.SQLException
     */
    public int addNewDoctorFeedback(DoctorFeedbacks feedback) throws SQLException {
        String sql = "insert into Doctor_Feedbacks (date,content,rate,patient_id,doctor_id) values (?,?,?,?,?)";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, feedback.getDate());
            ps.setString(2, feedback.getContent());
            ps.setInt(3, feedback.getRate());
            ps.setInt(4, feedback.getPatient().getPatientID());
            ps.setInt(5, feedback.getDoctor().getDoctorID());
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
     * @param doctorID
     * @return
     * @throws java.sql.SQLException
     */
    public List<DoctorFeedbacks> getAllDoctorFeedbacks(int doctorID) throws SQLException {
        List<DoctorFeedbacks> list = new ArrayList<>();
        String sql = "select * from Doctor_Feedbacks where doctor_id = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, doctorID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new DoctorFeedbacks(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), patientDB.getPatientByPatientID(rs.getInt(5)), doctorDB.getDoctorByDoctorID(rs.getInt(6))));
            }
            return list;
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
     * @throws java.sql.SQLException
     */
    public int getAverageRating(int doctorID) throws SQLException {
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

    /**
     *
     * @param feedback
     * @return
     * @throws java.sql.SQLException
     */
    public int updateDoctorFeedback(DoctorFeedbacks feedback) throws SQLException {
        String sql = "update Doctor_Feedbacks set date = ?, content = ?, rate = ? where patient_id = ? and doctor_id = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, feedback.getDate());
            ps.setString(2, feedback.getContent());
            ps.setInt(3, feedback.getRate());
            ps.setInt(4, feedback.getPatient().getPatientID());
            ps.setInt(5, feedback.getDoctor().getDoctorID());
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
     * @param patientID
     * @param doctorID
     * @return
     * @throws java.sql.SQLException
     */
    public int deleteDoctorFeedback(int patientID, int doctorID) throws SQLException {
        String sql = "delete from Doctor_Feedbacks where patient_id = ? and doctor_id = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, patientID);
            ps.setInt(2, doctorID);
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
     * @param doctorID
     * @return
     * @throws java.sql.SQLException
     */
    public int countAllDoctorFeedback(int doctorID) throws SQLException {
        String sql = "select count(*) from Doctor_Feedbacks where doctor_id = " + doctorID;
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
     * @param doctorID
     * @param pageNumber
     * @param numberOfItem
     * @param sort
     * @return
     * @throws java.sql.SQLException
     */
    public List<DoctorFeedbacks> paginateDoctorFeedbackByDoctorID(int doctorID, int start, int numberOfItem) throws SQLException {
        List<DoctorFeedbacks> list = new ArrayList<>();
        String sql = "SELECT * FROM doctor_feedbacks where doctor_id=" + doctorID + " order by feedback_id Limit " + numberOfItem + " offset " + start + ";";

        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
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
            DoctorFeedbacksDAO db = new DoctorFeedbacksDAO();
            List<DoctorFeedbacks> list = db.paginateDoctorFeedbackByDoctorID(1, 0, 3);
            System.out.println(list);
//        Patient patient = new Patient(1, "abc", 0, "", "", "", 2, "");
//        Doctor doctor = new Doctor(5, "", 0, "", "", "", "", null, "", "", 1);
//        DoctorFeedbacks feedback = new DoctorFeedbacks("2021-11-21", "abcacfa", 4, patient, doctor);
//        db.addNewDoctorFeedback(feedback);

//        System.out.println(db.getAverageRating(2));
//        List<DoctorFeedbacks> list = db.paginateDoctorFeedbackByDoctorID(1, 1, 5, "feedback_id");
//        System.out.println(list);
//            Patient patient = new Patient(1, "abc", 0, "", "", "", 2, "");
//            Doctor doctor = new Doctor(1, "", 0, "", "", "", "", null, "", "", 1);
//            DoctorFeedbacks fb = new DoctorFeedbacks("2021-11-11", "test", 5, patient, doctor);
//            db.updateDoctorFeedback(fb);
        } catch (SQLException ex) {
            Logger.getLogger(DoctorFeedbacksDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
