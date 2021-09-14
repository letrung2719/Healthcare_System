/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Phone;

/**
 *
 * @author TrungLT
 */
public class PhoneDAO extends DBContext {

    public List<Phone> getPhones() {
        List<Phone> list = new ArrayList<>();
        String sql = "select p.id,p.name,p.image,p.describe,p.releaseDate,"
                + "p.quantity,p.price,p.cid,c.name cname\n"
                + "from phone p inner join  Category c on c.id=p.cid";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Phone p = new Phone();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setImage(rs.getString("image"));
                p.setDescribe(rs.getString("describe"));
                p.setReleaseDate(rs.getString("releaseDate"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                Category c = new Category(rs.getInt("cid"), rs.getString("cname"));
                p.setCate(c);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Phone> getPhoneByPage(List<Phone> list,
            int start, int end) {
        List<Phone> t = new ArrayList<>();
        for (int i = start; i < end; i++) {
            t.add(list.get(i));
        }
        return t;
    }

}
