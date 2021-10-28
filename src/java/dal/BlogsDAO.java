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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Blogs;

/**
 *
 * @author admin
 */
public class BlogsDAO {

    PreparedStatement ps = null;
    ResultSet rs = null;
    
    DBContext dbc = new DBContext();
    Connection connection = null;

    /**
     *
     * @param blogID
     * @return
     */
    public Blogs getBlogByBlogID(int blogID) throws SQLException {
        String sql = "select * from blogs where blog_id = ?";
        try {
            connection = dbc.getConnection();
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
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return null;
    }

    /**
     *
     * @return
     */
    public List<Blogs> getAllBlogs() throws SQLException {
        List<Blogs> list = new ArrayList<>();
        String sql = "select blog_id,title,date,image,description from blogs";
        try {
            connection = dbc.getConnection();
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
            System.out.println(e);
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return list;
    }

    /**
     *
     * @param name
     * @return
     */
    public List<Blogs> getAllBlogsSearched(String name) throws SQLException {
        List<Blogs> list = new ArrayList<>();
        String sql = "select blog_id,title,date,image,description\n"
                + "from blogs where title like ?";
        try {
            connection = dbc.getConnection();
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
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return list;
    }

    /**
     *
     * @param args
     */
    public static void main(String[] args) {
        try {
            BlogsDAO bl = new BlogsDAO();
            List<Blogs> b = bl.getAllBlogsSearched("");
//        Blogs b = bl.getBlogByBlogID(1);
            System.out.println(b);
//        Blogs b = bl.getBlogByBlogID(1);
//        System.out.println(b);
//        List<Blogs> blog = bl.getAllBlogs();
//        System.out.println(blog);
        } catch (SQLException ex) {
            Logger.getLogger(BlogsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
