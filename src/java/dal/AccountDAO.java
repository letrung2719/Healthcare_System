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
import model.Account;

/**
 *
 * @author Admin
 */
public class AccountDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    /**
     *
     * @param user
     * @param pass
     * @return
     */
    public Account login(String user, String pass) {
        String sql = " select * from accounts where username=? and password = ?";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();//chay cau lenh tra ve
            while (rs.next()) {
                return new Account(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getBoolean(5));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     *
     * @param account_id
     * @return
     */
    public Account getAccountByID(int account_id) {
        String sql = " select * from accounts where account_id=?";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setInt(1, account_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getBoolean(5));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     *
     * @param password
     * @param account_id
     * @return
     */
    public int changePassword(String password, int account_id) {
        String sql = "update accounts set password=? where account_id = ?";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setString(1, password);
            ps.setInt(2, account_id);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    /**
     *
     * @return
     */
    public Account getNewestAccount() {
        String sql = "select * from accounts order by account_id desc limit 1";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),rs.getBoolean(5));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    /**
     *
     * @return
     */
    public List<Account> getAllAccount() {
        List<Account> ls = new ArrayList<>();
        String sql = "select * from accounts";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            rs = ps.executeQuery();
            while (rs.next()) {
                ls.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),rs.getBoolean(5)));
            }
            return ls;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     *
     * @param username
     * @param password
     */
    public void insertNewAccountPatient(String username, String password) {
        String sql = "insert into accounts(username,password,author_id,status) values(?,?,2,1)";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setString(1, username);
            ps.setString(2, password);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     *
     * @param user
     * @return
     */
    public Account checkAccountExist(String user) {
        String sql = "select * from accounts\n"
                + "where username = ?\n";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getBoolean(5));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    /**
     *
     * @param args
     */
    public static void main(String[] args) {
        AccountDAO accountDb = new AccountDAO();
        Account a = accountDb.login("patient1", "123");
        System.out.println(a.getPass());
//        int i = accountDb.changePassword("123", 22);
//        System.out.println(i);

//        System.out.println(accountDb.getNewestAccount());
//        int i = accountDb.changePassword("abcd",2);
//        System.out.println(i);
    }
}
