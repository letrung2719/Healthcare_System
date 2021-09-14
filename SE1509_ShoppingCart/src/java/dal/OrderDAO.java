
package dal;

import java.time.LocalDate;
import model.Cart;
import model.Customer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Item;

public class OrderDAO extends DBContext{
     public void addOrder(Customer u, Cart cart) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try{
            //add vào bảng Order
            String sql="insert into [order] values(?,?,?)";
            PreparedStatement st=con.prepareStatement(sql);
            st.setString(1, date);
            st.setInt(2, u.getId());
            st.setDouble(3, cart.getTotalMoney());
            st.executeUpdate();
            
            //lấy ra id của Order vừa add
            String sql1="select top 1 id from [Order] order by id desc";
            PreparedStatement st1=con.prepareStatement(sql1);
            ResultSet rs=st1.executeQuery();
            
            //add vào bảng OrderLine
            if(rs.next()){
                int oid=rs.getInt(1);
                for(Item i:cart.getItems()){
                String sql2="insert into [orderline] values(?,?,?,?)";
                PreparedStatement st2=con.prepareStatement(sql2);
                st2.setInt(1, oid);
                st2.setInt(2, i.getProduct().getId());
                st2.setInt(3, i.getQuantity());
                st2.setDouble(4, i.getPrice());
                st2.executeUpdate();
            }
            }
            //update so luong trong bang Product sau khi ban
            String sql3 = "update Product set quantity = quantity - ? "
                        + "where id = ?";
            PreparedStatement st3=con.prepareStatement(sql3);
            for(Item i:cart.getItems()){
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getId());
                st3.executeUpdate();
            }
            
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
}
