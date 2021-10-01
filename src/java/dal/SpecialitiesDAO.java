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
import model.Specialities;

/**
 *
 * @author Admin
 */
public class SpecialitiesDAO extends DBContext{
    
    public List<Specialities> getAllSpecialities(){
        List<Specialities> list = new ArrayList<>();
        String sql = "select * from Specialities";
        try{
           PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                list.add(new Specialities(rs.getInt(1), rs.getString(2)));
            }
            
        }catch(SQLException e){
            
        }
        return list;
    }
    public static void main(String[] args) {
        SpecialitiesDAO dao = new SpecialitiesDAO();
        List<Specialities> list = dao.getAllSpecialities();
        System.out.println(list);
    }
}
