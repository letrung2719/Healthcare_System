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
import model.Timetable;

/**
 *
 * @author admin
 */
public class TimetableDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public Timetable getTimeBySlotID(int slotID) {
        String sql = "select * from Timetable where slot_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, slotID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Timetable(rs.getInt(1), rs.getString(2));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
