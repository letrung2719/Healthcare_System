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
    PreparedStatement ps2 = null;
    ResultSet rs = null;

    /**
     *
     * @param accountID
     * @return
     */
    public Doctor getDoctorByAccountID(int accountID) {
        String sql = "select doctor_id,Doctors.name,gender,dob,phone,email,role,Doctors.type_id,Specialities.name,description,account_id,image\n"
                + "from Doctors join Specialities on Doctors.type_id = Specialities.type_id\n"
                + "where account_id =?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, accountID);
            rs = ps.executeQuery();
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
            System.out.println(e);
        }
        return null;
    }

    /**
     *
     * @param doctorID
     * @return
     */
    public Doctor getDoctorByDoctorID(int doctorID) {
        String sql = "select doctor_id,Doctors.name,gender,dob,phone,email,role,Doctors.type_id,Specialities.name,description,account_id,image\n"
                + "from Doctors join Specialities on Doctors.type_id = Specialities.type_id\n"
                + "where doctor_id =?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, doctorID);
            rs = ps.executeQuery();
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
            System.out.println(e);
        }
        return null;
    }

    /**
     *
     * @param p
     * @return
     */
    public int editDoctor(Doctor p) {
        String sql = "update Doctors set Name = ?, gender=? , dob=?,phone=?,description=?\n"
                + " where account_id=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, p.getName());
            ps.setInt(2, p.getGender());
            ps.setString(3, p.getDob());
            ps.setString(4, p.getPhone());
            ps.setString(5, p.getDescription());
            ps.setInt(6, p.getAccountID());
            return ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return 0;
    }

    /**
     *
     * @param id
     */
    public void delete(int id) {
        String sql = " delete from doctors where account_id=?";
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
     * @return
     */
    public List<Doctor> getAllDoctor() {
        ArrayList<Doctor> list = new ArrayList<>();
        String sql = "select doctor_id,Doctors.name,gender,dob, phone,email,[role],Doctors.type_id,Specialities.name, [description], account_id,image\n"
                + "from Doctors join Specialities on Doctors.type_id = Specialities.type_id";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
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

    /**
     *
     * @param list
     * @param begin
     * @param end
     * @return
     */
    public List<Doctor> getDoctorByPage(List<Doctor> list, int begin, int end) {
        List<Doctor> listDoctorByPage = new ArrayList<>();
        for (int i = begin; i < end; i++) {
            listDoctorByPage.add(list.get(i));
        }
        return listDoctorByPage;
    }

    /**
     *
     * @param doctorName
     * @param dob
     * @param phone
     * @param email
     * @param gender
     * @param listSpec
     * @return
     */
    public List<Doctor> search(String doctorName, String dob, String phone, String email, Integer gender, List<String> listSpec) {
        List<Doctor> list = new ArrayList<>();
        String sql = "select doctor_id, Doctors.name,gender,phone,email,role,image,description,doctors.type_id,Specialities.name,account_id\n"
                + "from Doctors join Specialities on Doctors.type_id = Specialities.type_id\n"
                + "where 1=1 ";
        if (doctorName != null && !doctorName.isEmpty()) {
            sql += " AND Doctors.name like '%" + doctorName + "%'";
        }
        if (dob != null && !dob.isEmpty()) {
            sql += " AND dob like '%" + dob + "%'";
        }
        if (phone != null && !phone.isEmpty()) {
            sql += " AND phone like '%" + phone + "%'";
        }
        if (email != null && !email.isEmpty()) {
            sql += " AND email like '%" + email + "%'";
        }
        if (gender != null) {
            sql += " AND gender = " + gender;
        }
        if (listSpec != null && !listSpec.isEmpty()) {
            sql += "and (";
            for (int i = 0; i < listSpec.size(); i++) {
                sql += "Specialities.name = '" + listSpec.get(i) + "' ";
                if (i < listSpec.size() - 1) {
                    sql += " or ";
                }
            }
            sql += ")";
        }

        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Doctor d = new Doctor();
                d.setDoctorID(rs.getInt(1));
                d.setName(rs.getString(2));
                d.setGender(rs.getInt(3));
                d.setPhone(rs.getString(4));
                d.setEmail(rs.getString(5));
                d.setRole(rs.getString(6));
                d.setImage(rs.getString(7));
                d.setDescription(rs.getString(8));
                Specialities spec = new Specialities(rs.getInt(9), rs.getString(10));
                d.setSpec(spec);
                d.setAccountID(rs.getInt(11));
                list.add(d);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    /**
     *
     * @param args
     */
    public static void main(String[] args) {
        DoctorDAO doctorDb = new DoctorDAO();
        List<Doctor> list = doctorDb.getAllDoctor();
        System.out.println(list);
//        Doctor d = doctorDb.getDoctorByDoctorID(2);
//        System.out.println(d);
//        String[] listSpec 
//        List<Doctor> list = doctorDb.search("", "", "", "", null, listSpec);
//        System.out.println(list);

    }
}
