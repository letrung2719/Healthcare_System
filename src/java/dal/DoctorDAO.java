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
import model.Specialities;

/**
 *
 * @author Admin
 */
public class DoctorDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public Doctor getDoctorByID(int doctorID) {
        String sql = "select doctor_id,Doctors.name,gender,dob, phone,email,[role],Doctors.type_id,Specialities.name, [description], account_id,image\n"
                + "from Doctors join Specialities on Doctors.type_id = Specialities.type_id\n"
                + "where doctor_id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, doctorID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Doctor p = new Doctor();
                p.setDoctorID(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setGender(rs.getInt(3));
                p.setDob(rs.getString(4));
                p.setPhone(rs.getString(5));
                p.setEmail(rs.getString(6));
                p.setRole(rs.getString(7));
                Specialities spec = new Specialities(rs.getInt(8), rs.getString(9));
                p.setSpec(spec);
                p.setDescription(rs.getString(10));
                p.setImage(rs.getString(12));
                p.setAccountID(rs.getInt(11));

                return p;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public int editDoctor(Doctor p) {
        String sql = "update Doctors set Name = ?, gender=? , dob=?,phone=?,email=?\n"
                + " where account_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getName());
            st.setInt(2, p.getGender());
            st.setString(3, p.getDob());
            st.setString(4, p.getPhone());
            st.setString(5, p.getEmail());
            st.setInt(6, p.getDoctorID());
            return st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return 0;
    }

    public void delete(int id) {
        String sql = " delete from doctors where account_id=?";
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

    public List<Doctor> getAllDoctor() {
        ArrayList<Doctor> list = new ArrayList<>();
        String sql = "select doctor_id,Doctors.name,gender,dob, phone,email,[role],Doctors.type_id,Specialities.name, [description], account_id,image\n"
                + "from Doctors join Specialities on Doctors.type_id = Specialities.type_id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Doctor p = new Doctor();
                p.setDoctorID(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setGender(rs.getInt(3));
                p.setDob(rs.getString(4));
                p.setPhone(rs.getString(5));
                p.setEmail(rs.getString(6));
                p.setRole(rs.getString(7));
                Specialities spec = new Specialities(rs.getInt(8), rs.getString(9));
                p.setSpec(spec);
                p.setDescription(rs.getString(10));
                p.setImage(rs.getString(12));
                p.setAccountID(rs.getInt(11));
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public static void main(String[] args) {
        DoctorDAO doctorDb = new DoctorDAO();
        List<Doctor> list = doctorDb.getAllDoctor();
        System.out.println(list);
//        Doctor d = doctorDb.getDoctorByID(1);
//        System.out.println(d);
    }
}
