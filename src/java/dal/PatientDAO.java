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
import model.Account;
import model.Patients;

/**
 *
 * @author Admin
 */
public class PatientDAO extends DBContext {

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

    public Patients getPatientByID(int id) {
        String sql = "select * from patients where account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Patients p = new Patients();
                p.setPatientID(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setGender(rs.getInt(3));
                p.setDob(rs.getString(4));
                p.setAccountID(rs.getInt(7));
                p.setPhone(rs.getString(5));
                p.setEmail(rs.getString(6));
                return p;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public static void main(String[] args) {
        PatientDAO patientDb = new PatientDAO();
//        Patients p = patientDb.getPatientByID(2);
//        System.out.println(p);

//        List<Patients> list = patientDb.getAllPatient();
//        System.out.println(list);
//         

    }

    public void insertNewPatient(Patients u) {
        AccountDAO accountDb = new AccountDAO();
        Account a = accountDb.getNewestAccount();
        String sql = "insert into Patients(name,gender,dob,phone,email,account_id) values (?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setString(1, u.getName());
            ps.setInt(2, u.getGender());
            ps.setString(3, u.getDob());
            ps.setString(4, u.getPhone());
            ps.setString(5, u.getEmail());
            ps.setInt(6, a.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Patients> getAllPatient() {
        ArrayList<Patients> list = new ArrayList<>();
        String sql = "select * from Patients ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Patients p = new Patients();
                p.setPatientID(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setGender(rs.getInt(3));
                p.setDob(rs.getString(4));
                p.setAccountID(rs.getInt(7));
                p.setPhone(rs.getString(5));
                p.setEmail(rs.getString(6));

                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public int editPatient(Patients p) {
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

}
