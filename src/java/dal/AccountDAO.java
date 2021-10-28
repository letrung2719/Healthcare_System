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
import model.Account;

/**
 *
 * @author Admin
 */
public class AccountDAO {

    PreparedStatement ps = null;
    ResultSet rs = null;
    DBContext dbc = new DBContext();
    Connection connection = null;

    /**
     *
     * @param user
     * @param pass
     * @return
     * @throws java.sql.SQLException
     */
    public Account login(String user, String pass) throws SQLException {
        String sql = " select * from accounts where username=? and password = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();//chay cau lenh tra ve
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5));
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
     * @param account_id
     * @return
     * @throws java.sql.SQLException
     */
    public Account getAccountByID(int account_id) throws SQLException {
        String sql = " select * from accounts where account_id=?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setInt(1, account_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5));
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
     * @param password
     * @param account_id
     * @return
     * @throws java.sql.SQLException
     */
    public int changePassword(String password, int account_id) throws SQLException {
        String sql = "update accounts set password=? where account_id = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setString(1, password);
            ps.setInt(2, account_id);
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
    public Account getNewestAccount() throws SQLException {
        String sql = "select * from accounts order by account_id desc limit 1";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5));
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
     * @return @throws java.sql.SQLException
     */
    public List<Account> getAllAccount() throws SQLException {
        List<Account> ls = new ArrayList<>();
        String sql = "select * from accounts";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            rs = ps.executeQuery();
            while (rs.next()) {
                ls.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5)));
            }
            return ls;
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
     * @param username
     * @param password
     * @throws java.sql.SQLException
     */
    public void insertNewAccountPatient(String username, String password) throws SQLException {
        String sql = "insert into accounts(username,password,author_id,status) values(?,?,2,1)";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setString(1, username);
            ps.setString(2, password);
            ps.executeUpdate();
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
     * @param user
     * @return
     * @throws java.sql.SQLException
     */
    public Account checkAccountExist(String user) throws SQLException {
        String sql = "select * from accounts\n"
                + "where username = ?\n";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5));
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
     * @param args
     */
    public static void main(String[] args) {
        AccountDAO accountDb = new AccountDAO();
        Account a;
        try {
            a = accountDb.login("patient1", "12345");
            System.out.println(a);
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
//        int i = accountDb.changePassword("123", 22);
//        System.out.println(i);

//        System.out.println(accountDb.getNewestAccount());
//        int i = accountDb.changePassword("abcd",2);
//        System.out.println(i);
    }
}
