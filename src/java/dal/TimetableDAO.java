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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Timetable;

/**
 *
 * @author admin
 */
public class TimetableDAO {

    PreparedStatement ps = null;
    ResultSet rs = null;
    
    DBContext dbc = new DBContext();
    Connection connection = null;

    /**
     *
     * @param slotID
     * @return
     * @throws java.sql.SQLException
     */
    public Timetable getTimeBySlotID(int slotID) throws SQLException {
        String sql = "select * from Timetable where slot_id = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, slotID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Timetable(rs.getInt(1), rs.getString(2));
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

    public Timetable getSlotByTime(String time) throws SQLException {
        String sql;
        sql = "select * from timetable where time = '" + time + "'";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                return new Timetable(rs.getInt(1), rs.getString(2));
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

    public static void main(String[] args) {
        try {
            TimetableDAO db = new TimetableDAO();
            Timetable t = db.getTimeBySlotID(2);
            System.out.println(t);
        } catch (SQLException ex) {
            Logger.getLogger(TimetableDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
