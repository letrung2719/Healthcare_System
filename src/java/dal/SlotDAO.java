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
import model.TimeTable;

/**
 *
 * @author Admin
 */
public class SlotDAO extends DBContext{
    public TimeTable getSlotByID(int slotID){
        String sql = "select * from Timetable where slot_id = "+slotID;
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()){
               TimeTable t = new TimeTable(rs.getInt(1), rs.getString(2));
               return t;
            }
            
        }catch(SQLException e){
            
        }
        return null;
    }
    public static void main(String[] args) {
        SlotDAO slotDb = new SlotDAO();
        TimeTable t = slotDb.getSlotByID(2);
        System.out.println(t);
    }
}
