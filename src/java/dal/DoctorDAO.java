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
import model.Specialities;

/**
 *
 * @author Admin
 */
public class DoctorDAO {

    PreparedStatement ps = null;
    PreparedStatement ps2 = null;
    ResultSet rs = null;

    DBContext dbc = new DBContext();
    Connection connection = null;

    /**
     *
     * @param accountID
     * @return
     * @throws java.sql.SQLException
     */
    public Doctor getDoctorByAccountID(int accountID) throws SQLException {
        String sql = "select doctor_id,doctors.name,gender,dob,phone,email,role,doctors.type_id,specialities.name,description,account_id,image\n"
                + "from doctors join specialities on doctors.type_id = specialities.type_id\n"
                + "where account_id = ?";
        try {
            connection = dbc.getConnection();
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
    public Doctor getDoctorByDoctorID(int doctorID) throws SQLException {
        String sql = "select doctor_id,doctors.name,gender,dob,phone,email,role,Doctors.type_id,specialities.name,description,account_id,image\n"
                + "from doctors join specialities on doctors.type_id = specialities.type_id\n"
                + "where doctor_id =?";
        try {
            connection = dbc.getConnection();
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
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return null;
    }

    /**
     *
     * @param p
     * @return
     * @throws java.sql.SQLException
     */
    public int editDoctor(Doctor p) throws SQLException {
        String sql = "update doctors set name=?,gender=?,dob=?,phone=?,description=?\n"
                + "where account_id = ?";
        try {
            connection = dbc.getConnection();
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
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return 0;
    }

    /**
     *
     * @param id
     * @throws java.sql.SQLException
     */
    public void delete(int id) throws SQLException {
        String sql = " delete from doctors where account_id = ?";
        String sql2 = " delete from accounts where account_id = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps2 = connection.prepareStatement(sql2);
            ps.setInt(1, id);
            ps2.setInt(1, id);
            ps.executeUpdate();
            ps2.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
    }

    /**
     *
     * @return @throws java.sql.SQLException
     */
    public List<Doctor> getAllDoctor() throws SQLException {
        ArrayList<Doctor> list = new ArrayList<>();
        String sql = "select doctor_id,doctors.name,gender,DATE_FORMAT(dob, \"%e %M %Y\"), phone,email,role,doctors.type_id,specialities.name,description,account_id,image\n"
                + "from doctors join specialities on doctors.type_id = specialities.type_id";
        try {
            connection = dbc.getConnection();
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
     * @throws java.sql.SQLException
     */
    public List<Doctor> search(String doctorName, String dob, String phone, String email, Integer gender, List<String> listSpec) throws SQLException {
        List<Doctor> list = new ArrayList<>();
        String sql = "select doctor_id,doctors.name,gender,phone,email,role,image,description,doctors.type_id,specialities.name,account_id,DATE_FORMAT(dob, \"%e %M %Y\")\n"
                + "from doctors join specialities on doctors.type_id = specialities.type_id\n"
                + "where 1=1 ";
        if (doctorName != null && !doctorName.isEmpty()) {
            sql += " AND doctors.name like '%" + doctorName + "%'";
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
            if (!listSpec.get(0).equals("")) {
                sql += "and (";
                for (int i = 0; i < listSpec.size(); i++) {

                    sql += "specialities.name = '" + listSpec.get(i) + "' ";
                    if (i < listSpec.size() - 1) {
                        sql += " or ";
                    }
                }
                sql += ")";
            }

        }
        System.out.println(sql);
        try {
            connection = dbc.getConnection();
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
                d.setDob(rs.getString(12));
                list.add(d);
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
            DoctorDAO doctorDb = new DoctorDAO();
//            Specialities spec = new Specialities(1, "abc");
////        Doctor d = new Doctor(20, "Le Van Nam", 1, "2000-01-01", "0123456789", "abc@gmail.com", "Head of Department", spec, "abc", "abc", 21);
////        List<Doctor> list = doctorDb.getAllDoctor();
////        List<Doctor> d = doctorDb.getDoctorByPage(list, 1, 5);
//            Doctor d = doctorDb.getDoctorByAccountID(7);
//            System.out.println(d);
//        Doctor d = doctorDb.getDoctorByDoctorID(2);
//        System.out.println(d);
        List<String> listSpec = new ArrayList<String>();
        List<Doctor> list = doctorDb.search("", "", "", "", null, listSpec);
        System.out.println(list);
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
