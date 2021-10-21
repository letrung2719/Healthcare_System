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
import model.Timetable;

/**
 *
 * @author admin
 */
public class TimetableDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    /**
     *
     * @param slotID
     * @return
     */
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
    public Timetable getSlotByTime(String time){
        String sql;
        sql = "select * from timetable where time = '"+ time+"'";
        try{
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            
            if (rs.next()){
                return new Timetable(rs.getInt(1), rs.getString(2));
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    public static void main(String[] args) {
        TimetableDAO db = new TimetableDAO();
        Timetable t = db.getTimeBySlotID(2);
        System.out.println(t);
    }
}
