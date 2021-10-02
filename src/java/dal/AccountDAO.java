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
import model.Account;

/**
 *
 * @author Admin
 */
public class AccountDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public Account login(String user, String pass) {
        String sql = " select * from Accounts where username=? and password = ?";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();//chay cau lenh tra ve
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account getAccountByID(int account_id) {
        String sql = " select * from Accounts where account_id=?";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setInt(1, account_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int changePassword(String password, int account_id) {
        String sql = "update Accounts set password=? where account_id = ?";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setString(1, password);
            ps.setInt(2, account_id);
            return ps.executeUpdate();
        } catch (SQLException e) {

        }
        return 0;
    }

    public static void main(String[] args) {
        AccountDAO accountDb = new AccountDAO();
        Account a = accountDb.getAccountByID(22);
        System.out.println(a);

//        System.out.println(accountDb.getNewestAccount());
//        int i = accountDb.changePassword("abcd",2);
//        System.out.println(i);
    }

    public Account getNewestAccount() {
        String sql = "select top 1 * from Accounts order by account_id desc";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertNewAccountPatient(String username, String password) {
        String sql = "insert into Accounts values(?,?,2)";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setString(1, username);
            ps.setString(2, password);
            ps.executeUpdate();
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
                        rs.getString(3), rs.getInt(4));
            }
        } catch (Exception e) {
        }
        return null;
    }
}
