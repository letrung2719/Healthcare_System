package dal;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Users;

public class DAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public Account login(String user, String pass) {
        String sql = "select UserID, username, [password] from Accounts\n"
                + "where [username] = ?\n"
                + "and password = ?";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();//chay cau lenh tra ve
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Users getPatientByID(int id) {
        String sql = "select * from Users where UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users p = new Users();
                p.setUserID(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setGender(rs.getInt(3));
                p.setDob(rs.getString(4));
                p.setPhone(rs.getString(5));
                p.setEmail(rs.getString(6));
                return p;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public Account getNewestAccount() {
        String sql = "select top 1 * from Accounts order by UserID desc";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertNewAccount(Account ac) {
        String sql = "insert into Accounts values(?,?)";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setString(1, ac.getUser());
            ps.setString(2, ac.getPass());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertNewUser(Users u) {
        DAO dao = new DAO();
        Account a = dao.getNewestAccount();
        String sql = "insert into Users values(?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setInt(1, a.getId());
            ps.setString(2, u.getName());
            ps.setInt(3, u.getGender());
            ps.setString(4, u.getDob());
            ps.setString(5, u.getPhone());
            ps.setString(6, u.getEmail());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Users> getAllUsers() {
        ArrayList<Users> list = new ArrayList<>();
        String sql = "select * from Users ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users p = new Users();
                p.setUserID(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setGender(rs.getInt(3));
                p.setDob(rs.getString(4));
                p.setPhone(rs.getString(5));
                p.setEmail(rs.getString(6));
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public void delete(int id) {
        String sql = "DELETE FROM Users\n"
                + "WHERE [USERs].UserID = ?";
        String sql2 = "DELETE FROM Accounts\n"
                + "WHERE Accounts.UserID = ?";
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

    public Account checkAccountExist(String user) {
        String sql = "select * from accounts\n"
                + "where [username] = ?\n";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3));
            }
        } catch (Exception e) {
        }
        return null;
    }
    public void update

    public static void main(String[] args) {
        DAO dao = new DAO();
        Users a = dao.getPatientByID(2);
        System.out.println(a);
//        dao.insertNewUser(new Users(7, "minhqq", 0, "2000-12-10", "0123456789", "teo@gmail.com"));
        if (a == null) {
            System.out.println("fail");
        } else {
            System.out.println("yes");
        }
    }
}
