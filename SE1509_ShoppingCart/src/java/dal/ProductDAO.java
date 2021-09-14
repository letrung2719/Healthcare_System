
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;


public class ProductDAO extends DBContext{
    public List<Product> getAll(){
        List<Product> list=new ArrayList<>();
        String sql="select * from Product";
        try{
            PreparedStatement st=con.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Product p=new Product(rs.getInt("id"),
                                      rs.getString("name"),
                                      rs.getDouble("price"),
                                      rs.getInt("quantity"));
                list.add(p);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    public Product getProductByID(int id){
        String sql="select * from Product where id=?";
        try{
            PreparedStatement st=con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                return new Product(id,
                                   rs.getString("name"),
                                   rs.getDouble("price"),
                                   rs.getInt("quantity"));
            }                
        }catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    
}
