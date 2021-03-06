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
import model.Patient;

/**
 *
 * @author Admin
 */
public class PatientDAO {

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
    public Patient getPatientByAccountID(int accountID) throws SQLException {
        String sql = "select * from patients where account_id = ?";
        try {
            connection = dbc.getConnection();
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
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return null;
    }

    /**
     *
     * @param patientID
     * @return
     */
    public Patient getPatientByPatientID(int patientID) throws SQLException {
        String sql = "select * from patients where patient_id = ?";
        try {
            connection = dbc.getConnection();
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
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return null;
    }

    public Patient getPatientByEmail(String email) throws SQLException {
        String sql = "select * from patients where email = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
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
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return null;
    }

    /**
     *
     * @param u
     * @throws java.sql.SQLException
     */
    public int insertNewPatient(Patient u) throws SQLException {
        String sql = "insert into Patients(name,gender,dob,phone,email,image,account_id) values (?,?,?,?,?,?,?)";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setString(1, u.getName());
            ps.setInt(2, u.getGender());
            ps.setString(3, u.getDob());
            ps.setString(4, u.getPhone());
            ps.setString(5, u.getEmail());
            ps.setString(6, u.getImage());
            ps.setInt(7, u.getAccountID());
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
     * @return @throws java.sql.SQLException
     */
    public List<Patient> getAllPatient() throws SQLException {
        ArrayList<Patient> list = new ArrayList<>();
        String sql = "select * from Patients ";
        try {
            connection = dbc.getConnection();
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
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return list;
    }

    /**
     *
     * @param p
     * @return
     * @throws java.sql.SQLException
     */
    public int editPatient(Patient p) throws SQLException {
        String sql = "update patients set Name = ?, gender = ? , dob = ?, phone = ?, email = ?\n"
                + " where account_id=?";
        try {
            connection = dbc.getConnection();
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
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return 0;
    }

    public String checkEmailExisted(String email) throws SQLException {
        PatientDAO patientDb = new PatientDAO();
        List<Patient> p = patientDb.getAllPatient();
        for (Patient patient : p) {
            if (email.equals(patient.getEmail())) {
                return email;
            }
        }
        return null;
    }

    public Patient getPatientByPatientIdForAdmin(int patientID) throws SQLException {
        String sql = "select patients.patient_id, name, gender, dob, phone, email, image, sum(price)\n"
                + "from patients \n"
                + "join reservations on reservations.patient_id = patients.patient_id\n"
                + "where patients.patient_id = ?";
        try {
            connection = dbc.getConnection();
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
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return null;
    }

    public List<Patient> search(String name) throws SQLException {
        List<Patient> list = new ArrayList<>();
        String sql = "select patient_id, name, gender, dob, phone, email, account_id, image \n"
                + " from patients where name like ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Patient(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8)));
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
            PatientDAO patientDb = new PatientDAO();
//        Patient p = new Patient("Nguyen Van Minh", 0, "2001-12-12", "0123456789", "abc@gmail.com", 31, "");
//            List<Patient> p = patientDb.getAllPatient();
//            System.out.println(p);
            AccountDAO accDb = new AccountDAO();
//            patientDb.insertNewPatient(new Patient("abc", 0, null, "0123456789", "abc@gmail.com", accDb.getNewestAccount().getId(), ""));
            System.out.println(patientDb.getPatientByEmail("hoangtvhe151161@fpt.edu.vn").toString());
        } catch (SQLException ex) {
            Logger.getLogger(PatientDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
