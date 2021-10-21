/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import dbcontext.DBContext;
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
    PreparedStatement ps2 = null;
    ResultSet rs = null;

    /**
     *
     * @param accountID
     * @return
     */
    public Patient getPatientByAccountID(int accountID) {
        String sql = "select * from patients where account_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, accountID);
            rs = ps.executeQuery();
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
            System.out.println(e);
        }
        return null;
    }

    /**
     *
     * @param patientID
     * @return
     */
    public Patient getPatientByPatientID(int patientID) {
        String sql = "select * from patients where patient_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, patientID);
            rs = ps.executeQuery();
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
            System.out.println(e);
        }
        return null;
    }

    /**
     *
     * @param id
     */
    public void delete(int id) {
        String sql = " delete from Patients where account_id=?";
        String sql2 = " delete from Accounts where account_id=?";
        try {
            ps = connection.prepareStatement(sql);
            ps2 = connection.prepareStatement(sql2);
            ps.setInt(1, id);
            ps2.setInt(1, id);
            ps.executeUpdate();
            ps2.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     *
     * @param u
     */
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

    /**
     *
     * @return
     */
    public List<Patient> getAllPatient() {
        ArrayList<Patient> list = new ArrayList<>();
        String sql = "select * from Patients ";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
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
            connection.close();
        } catch (SQLException e) {
            System.out.println(e);
        } 
        return list;
    }

    /**
     *
     * @param p
     * @return
     */
    public int editPatient(Patient p) {
        String sql = "update patients set Name = ?, gender = ? , dob = ?, phone = ?, email = ?\n"
                + " where account_id=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, p.getName());
            ps.setInt(2, p.getGender());
            ps.setString(3, p.getDob());
            ps.setString(4, p.getPhone());
            ps.setString(5, p.getEmail());
            ps.setInt(6, p.getAccountID());
            return ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return 0;
    }

    /**
     *
     * @param args
     */
    public static void main(String[] args) {
        PatientDAO patientDb = new PatientDAO();
//        Patient p = new Patient("Nguyen Van Minh", 0, "2001-12-12", "0123456789", "abc@gmail.com", 31, "");
        List<Patient> p = patientDb.getAllPatient();
        System.out.println(p);
//        patientDb.insertNewPatient(new Patient("abc", 0, "", "0123456789", "abc@gmail.com", 34, ""));
    }
}
