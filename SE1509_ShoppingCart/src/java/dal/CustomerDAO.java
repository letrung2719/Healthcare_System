
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Customer;


public class CustomerDAO extends DBContext{
    public Customer getAcount(String user,String pass){
            String sql="select * from customer "
                    + "where username=? and password=?";
            try{
                PreparedStatement st=con.prepareStatement(sql);
                st.setString(1, user);
                st.setString(2, pass);
                ResultSet rs=st.executeQuery();
                if(rs.next()){
                    return new Customer(rs.getInt("id"),
                                      rs.getString("name"),
                                      rs.getDouble("amount"),
                                      rs.getString("username"),
                                      rs.getString("password"));
                }
            }catch(SQLException e){
                System.out.println(e);
            }            
            return null;
        }
    
}
