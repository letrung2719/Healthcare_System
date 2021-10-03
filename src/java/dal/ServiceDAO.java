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
import model.Service;
import model.Specialities;

/**
 *
 * @author ASUS
 */
public class ServiceDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public Service getServiceByID(String id) {
        String sql = "select * from [Services]\n"
                + "where service_id = ?";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Service(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Service> getTop4Last(int id) {
        List<Service> list = new ArrayList<>();
        String sql = "select top 4 * from [services]\n"
                + "where type_id = ?\n"
                + "order by service_id desc";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Service(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
            }
        } catch (Exception e) {
        }

        return list;

    }

    public Specialities getSpecByID(int id) {
        String sql = "select * from Specialities\n"
                + "where type_id = ?";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Specialities(rs.getInt(1),
                        rs.getString(2));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        AccountDAO accountDb = new AccountDAO();
//        Account a = accountDb.getAccountByID(7);
//        System.out.println(a);
//        int i = accountDb.changePassword("abcd", 3);
        ServiceDAO ser = new ServiceDAO();
//        Service i = ser.getServiceByID("1");
//        System.out.println(i);
//        
//        
//        Specialities  s = ser.getSpecByID(2);
//        System.out.println(s);

        List<Service> list = ser.getTop4Last(8);
        for (Service o : list) {
            System.out.println(o);

        }
    }
}
