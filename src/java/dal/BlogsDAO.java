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
import java.util.ArrayList;
import java.util.List;
import model.Blogs;

/**
 *
 * @author admin
 */
public class BlogsDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    /**
     *
     * @param blogID
     * @return
     */
    public Blogs getBlogByBlogID(int blogID) {
        String sql = "select * from blogs where blog_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, blogID);
            rs = ps.executeQuery();
            if (rs.next()) {
                Blogs b = new Blogs();
                b.setBlogID(rs.getInt(1));
                b.setTitle(rs.getString(2));
                b.setDate(rs.getString(3));
                b.setImage(rs.getString(4));
                b.setDescription(rs.getString(5));
                return b;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     *
     * @return
     */
    public List<Blogs> getAllBlogs() {
        List<Blogs> list = new ArrayList<>();
        String sql = "select blog_id,title,date,image,description from blogs";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Blogs bl = new Blogs();
                bl.setBlogID(rs.getInt(1));
                bl.setTitle(rs.getString(2));
                bl.setDate(rs.getString(3));
                bl.setImage(rs.getString(4));
                bl.setDescription(rs.getString(5));
                list.add(bl);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    /**
     *
     * @param name
     * @return
     */
    public List<Blogs> getAllBlogsSearched(String name) {
        List<Blogs> list = new ArrayList<>();
        String sql = "select blog_id,title,date,image,description\n"
                + "from blogs where title like ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Blogs(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     *
     * @param args
     */
    public static void main(String[] args) {
        BlogsDAO bl = new BlogsDAO();
        List<Blogs> b = bl.getAllBlogsSearched("");
//        Blogs b = bl.getBlogByBlogID(1);
        System.out.println(b);
//        Blogs b = bl.getBlogByBlogID(1);
//        System.out.println(b);
//        List<Blogs> blog = bl.getAllBlogs();
//        System.out.println(blog);
    }
}
