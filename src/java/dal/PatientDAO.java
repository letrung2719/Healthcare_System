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
import model.Patient;

/**
 *
 * @author Admin
 */
public class PatientDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public Patient getPatientByAccountID(int accountID) {
        String sql = "select * from patients where account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Patient p = new Patient();
                p.setPatientID(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setGender(rs.getInt(3));
                p.setDob(rs.getString(4));
                p.setAccountID(rs.getInt(8));
                p.setPhone(rs.getString(5));
                p.setEmail(rs.getString(6));
                p.setImage(rs.getString(7));
                return p;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public Patient getPatientByPatientID(int patientID) {
        String sql = "select * from patients where patient_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, patientID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Patient p = new Patient();
                p.setPatientID(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setGender(rs.getInt(3));
                p.setDob(rs.getString(4));
                p.setAccountID(rs.getInt(8));
                p.setPhone(rs.getString(5));
                p.setEmail(rs.getString(6));
                p.setImage(rs.getString(7));
                return p;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public void delete(int id) {
        String sql = " delete from Patients where account_id=?";
        String sql2 = " delete from Accounts where account_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st.setInt(1, id);
            st2.setInt(1, id);
            st.executeUpdate();
            st2.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertNewPatient(Patient u) {
        String sql = "insert into Patients(name,gender,dob,phone,email,image,account_id) values (?,?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setString(1, u.getName());
            ps.setInt(2, u.getGender());
            ps.setString(3, u.getDob());
            ps.setString(4, u.getPhone());
            ps.setString(5, u.getEmail());
            ps.setString(6, u.getImage());
            ps.setInt(7, u.getAccountID());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Patient> getAllPatient() {
        ArrayList<Patient> list = new ArrayList<>();
        String sql = "select * from Patients ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Patient p = new Patient();
                p.setPatientID(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setGender(rs.getInt(3));
                p.setDob(rs.getString(4));
                p.setAccountID(rs.getInt(8));
                p.setPhone(rs.getString(5));
                p.setEmail(rs.getString(6));
                p.setImage(rs.getString(7));
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public int editPatient(Patient p) {
        String sql = "update Patients set Name = ?, gender=? , dob=?,phone=?,email=?\n"
                + " where account_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getName());
            st.setInt(2, p.getGender());
            st.setString(3, p.getDob());
            st.setString(4, p.getPhone());
            st.setString(5, p.getEmail());
            st.setInt(6, p.getAccountID());
            return st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return 0;
    }

    public static void main(String[] args) {
        PatientDAO patientDb = new PatientDAO();
        patientDb.insertNewPatient(new Patient("abc", 0, "", "0123456789", "abc@gmail.com", 34, ""));
    }
}
