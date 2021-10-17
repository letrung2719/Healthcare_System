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
import model.DoctorFeedback;
import model.Patient;

/**
 *
 * @author Admin
 */
public class DoctorFeedbackDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    PatientDAO dalPatient = new PatientDAO();
    DoctorDAO dalDoctor = new DoctorDAO();

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

    public List<DoctorFeedback> paginateDoctorFeedbackByDoctorID(int doctorID, int pageNumber, int numberOfItem, String sort) {
        List<DoctorFeedback> list = new ArrayList<>();
        String sql = "DECLARE @PageNumber AS INT\n"
                + "DECLARE @RowsOfPage AS INT\n"
                + "SET @PageNumber="+pageNumber +"\n"
                + "SET @RowsOfPage="+numberOfItem+"\n"
                + "SELECT * FROM Doctor_Feedbacks where doctor_id="+doctorID+"\n"
                + "ORDER BY "+sort+"\n"
                + "OFFSET (@PageNumber-1)*@RowsOfPage ROWS\n"
                + "FETCH NEXT @RowsOfPage ROWS ONLY" ;
        try{
            PreparedStatement st= connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()){
                DoctorFeedback df = new DoctorFeedback();
                df.setFeedbackID(rs.getInt(1));
                df.setContent(rs.getString(2));
                df.setRate(rs.getInt(3));
                Doctor d = dalDoctor.getDoctorByDoctorID(rs.getInt(5));
                Patient p = dalPatient.getPatientByPatientID(rs.getInt(4));
                df.setDoctor(d);
                df.setPatient(p);
                list.add(df);
            }
        }catch(SQLException e){
            
        }
        return list;
    }
    public static void main(String[] args) {
        DoctorFeedbackDAO db = new DoctorFeedbackDAO();
        List<DoctorFeedback> list = db.paginateDoctorFeedbackByDoctorID(2, 1, 4, "rate desc");
        System.out.println(list);
    }
}
