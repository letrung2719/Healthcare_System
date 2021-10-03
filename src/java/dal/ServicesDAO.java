package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Services;
import model.Specialities;

public class ServicesDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public Services getServiceByID(String id) {
        String sql = "select * from [Services]\n"
                + "where service_id = ?";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Services(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Services> getTop4Last(String id) {
        List<Services> list = new ArrayList<>();
        String sql = "select top 4 * from [services]\n"
                + "where type_id = ?\n"
                + "order by service_id desc";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setString(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Services(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
            }
        } catch (Exception e) {
        }

        return list;

    }

    public Specialities getSpecByID(String id) {
        String sql = "select * from Specialities\n"
                + "where type_id = ?";
        try {
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Specialities(rs.getInt(1),
                        rs.getString(2));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Specialities> getAllSpecialities() {
        List<Specialities> list = new ArrayList<>();
        String sql = "select * from Specialities";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Specialities(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Services> getAllServices() {
        List<Services> list = new ArrayList<>();
        String sql = "SELECT [service_id]\n"
                + "      ,[title]\n"
                + "      ,Specialities.[name]\n"
                + "      ,[image]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "FROM [Services] join [Specialities] ON [Services].[type_id] = [Specialities].[type_id]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Services(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Services> getAllServicesSearched(String name) {
        List<Services> list = new ArrayList<>();
        String sql = "SELECT [service_id]\n"
                + "      ,[title]\n"
                + "      ,Specialities.[name]\n"
                + "      ,[image]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "FROM [Services] join [Specialities] ON [Services].[type_id] = [Specialities].[type_id] where [title] like ? or Specialities.[name] like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            st.setString(2, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Services(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Services> getAllServicesSortedSpecialities() {
        List<Services> list = new ArrayList<>();
        String sql = "SELECT [service_id]\n"
                + "      ,[title]\n"
                + "      ,Specialities.[name]\n"
                + "      ,[image]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "FROM [Services] join [Specialities] ON [Services].[type_id] = [Specialities].[type_id] order by [Services].[type_id] asc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Services(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Services> getAllServicesSortedUpPrice() {
        List<Services> list = new ArrayList<>();
        String sql = "SELECT [service_id]\n"
                + "      ,[title]\n"
                + "      ,Specialities.[name]\n"
                + "      ,[image]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "FROM [Services] join [Specialities] ON [Services].[type_id] = [Specialities].[type_id] order by [Services].[price] desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Services(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Services> getAllServicesSortedDownPrice() {
        List<Services> list = new ArrayList<>();
        String sql = "SELECT [service_id]\n"
                + "      ,[title]\n"
                + "      ,Specialities.[name]\n"
                + "      ,[image]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "FROM [Services] join [Specialities] ON [Services].[type_id] = [Specialities].[type_id] order by [Services].[price] asc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Services(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Services> getAllServicesByTypeID(String id) {
        List<Services> list = new ArrayList<>();
        String sql = "select * from Services where type_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Services(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Services> searchSpecialities(List<String> listSpec) {
        List<Services> list = new ArrayList<>();
        String sql = "SELECT [service_id]\n"
                + "      ,[title]\n"
                + "      ,Specialities.[name]\n"
                + "      ,[image]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "FROM [Services] join [Specialities] ON [Services].[type_id] = [Specialities].[type_id] where 1=1 ";
        if (listSpec != null && !listSpec.isEmpty()) {
            sql += "and (";
            for (int i = 0; i < listSpec.size(); i++) {
                sql += "Specialities.name = '" + listSpec.get(i) + "' ";
                if (i < listSpec.size() - 1) {
                    sql += " or ";
                }
            }
            sql += ")";
        }
        System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Services(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public static void main(String[] args) {
        ServicesDAO dao = new ServicesDAO();
        List<Specialities> list = dao.getAllSpecialities();
        List<Services> listS = dao.getAllServicesSortedDownPrice();
        System.out.println(listS);
    }
}
