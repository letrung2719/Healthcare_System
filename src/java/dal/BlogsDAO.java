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
     * @throws java.sql.SQLException
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
     * @throws java.sql.SQLException
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
     * @throws java.sql.SQLException
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

    public void addBlog(String title, String date, String image, String description) throws SQLException {
        String sql = "insert into blogs (title, date, image, description)"
                + "values(?, ?, ?, ?)";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, date);
            ps.setString(3, image);
            ps.setString(4, description);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
    }

    public int editBlog(Blogs b) throws SQLException {
        String sql = "update blogs set title = ?, date = ? , image = ?, description = ?\n"
                + " where blog_id=?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, b.getTitle());
            ps.setString(2, b.getDate());
            ps.setString(3, b.getImage());
            ps.setString(4, b.getDescription());
            ps.setInt(5, b.getBlogID());
            return ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return 0;
    }

    public int deleteBlog(int BlogID) throws SQLException {
        String sql = "delete from Blogs \n"
                + "where blog_id = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, BlogID);

            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return 0;
    }

    public List<Blogs> search(String title, String date) throws SQLException {
        List<Blogs> list = new ArrayList<>();
        String sql = "select *\n"
                + "from blogs\n"
                + "where 1=1";
        if (title != null && !title.isEmpty()) {
            sql += " AND title like '%" + title + "%'";
        }
        if (date != null && !date.isEmpty()) {
            sql += " AND date like '%" + date + "%'";

        }

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
     * @param args
     */
    public static void main(String[] args) {
        try {
            BlogsDAO bl = new BlogsDAO();
//            List<Blogs> b = bl.search("ơ", "2021-11-01");
//            Blogs bl1 = new Blogs(10, "yeu em", "2021-11-01", "https://s11.favim.com/orig/7/760/7601/76010/jisoo-blackpink-rose-Favim.com-7601059.gif", "yeu em 3000");
//            bl.addBlog("yeu em", "2021/11/01", "https://s11.favim.com/orig/7/760/7601/76010/jisoo-blackpink-rose-Favim.com-7601059.gif", "yeu em 3000");
//            bl.editBlog(bl1);
             System.out.println(bl.getAllBlogs());

        } catch (SQLException ex) {
            Logger.getLogger(BlogsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
