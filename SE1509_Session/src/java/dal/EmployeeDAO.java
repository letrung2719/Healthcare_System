/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Employee;

/**
 *
 * @author TrungLT
 */
public class EmployeeDAO extends DBContext {

    // list employee in database
    public List<Employee> getAll() {
        List<Employee> list = new ArrayList<>();
        String sql = "select * from Employee";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Employee e = new Employee();
                e.setId(rs.getInt("id"));
                e.setName(rs.getString("name"));
                e.setGender(rs.getBoolean("gender"));
                e.setDob(rs.getString("dob"));
                e.setSalary(rs.getInt("salary"));
                list.add(e);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //get Employee where id = ?
    public Employee getEmployeeById(int id) {
        String sql = "select * from Employee where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Employee e = new Employee();
                e.setId(rs.getInt("id"));
                e.setName(rs.getString("name"));
                e.setGender(rs.getBoolean("gender"));
                e.setDob(rs.getString("dob"));
                e.setSalary(rs.getInt("salary"));
                return e;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //delete Employee where id = ?
    public int delete(int id) {
        String sql = "delete from Employee where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            return st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return 0;
    }

    // update Employee where id = ?
    public int update(Employee e) {
        String sql = "update Employee set name=?,"
                + "gender=?,"
                + "dob=?,"
                + "salary=? "
                + "where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, e.getName());
            st.setBoolean(2, e.getGender());
            st.setString(3, e.getDob());
            st.setInt(4, e.getSalary());
            st.setInt(5, e.getId());
            return st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return 0;
    }

    //insert into student values(?,?,?,?,?)
    public int insert(Employee e) {
        String sql = "insert into Employee values(?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, e.getId());
            st.setString(2, e.getName());
            st.setBoolean(3, e.getGender());
            st.setString(4, e.getDob());
            st.setInt(5, e.getSalary());
            return st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return 0;
    }
}
