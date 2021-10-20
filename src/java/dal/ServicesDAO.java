package dal;

import dbcontext.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.ServiceFeedbacks;
import model.ServiceFeedbacksAd;
import model.Services;
import model.Specialities;
import model.Timetable;

/**
 *
 * @author admin
 */
public class ServicesDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    /**
     *
     * @param id
     * @return
     */
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

    /**
     *
     * @param id
     * @return
     */
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
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;

    }

    /**
     *
     * @param id
     * @return
     */
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

    /**
     *
     * @return
     */
    public List<Specialities> getAllSpecialities() {
        List<Specialities> list = new ArrayList<>();
        String sql = "select * from Specialities";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Specialities(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     *
     * @return
     */
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
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
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

    /**
     *
     * @param name
     * @return
     */
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
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ps.setString(2, "%" + name + "%");
            rs = ps.executeQuery();
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

    /**
     *
     * @return
     */
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
            ps = connection.prepareStatement(sql);
             rs = ps.executeQuery();
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
            System.out.println(e);
        }
        return list;
    }

    /**
     *
     * @return
     */
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
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
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

    /**
     *
     * @return
     */
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
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
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

    /**
     *
     * @param id
     * @return
     */
    public List<Services> getAllServicesByTypeID(String id) {
        List<Services> list = new ArrayList<>();
        String sql = "select * from Services where type_id=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
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

    /**
     *
     * @param listSpec
     * @return
     */
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
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
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
    
    /**
     *
     * @return
     */
    public List<Services> getAllServiceDashboard() {
        List<Services> list = new ArrayList<>();
        String sql = "SELECT [Services].[service_id]\n"
                + "      ,[title]\n"
                + "      ,[type_id]\n"
                + "      ,[image]\n"
                + "      ,(SELECT AVG([rate])\n"
                + "        FROM [Service_Feedbacks]\n"
                + "        where service_id =[Services].[service_id]) as rate\n"
                + "      ,[price]\n"
                + "FROM [HealthcareSystem].[dbo].[Services] join Service_Feedbacks on [Services].service_id = Service_Feedbacks.service_id\n"
                + "group by [Services].[service_id],[title],[type_id],[image],[price]";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
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

    /**
     *
     * @param id
     * @return
     */
    public List<ServiceFeedbacksAd> getAllCommentAd(String id) {
        List<ServiceFeedbacksAd> list = new ArrayList<>();
        String sql = "SELECT [feedback_id],[content],[rate], [Patients].[image], [Patients].[name], [service_id]\n"
                + "FROM [HealthcareSystem].[dbo].[Service_Feedbacks] join [Patients] \n"
                + "ON [Service_Feedbacks].[patient_id] = [Patients].[patient_id] where [service_id] = ?";
        try {

            ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ServiceFeedbacksAd(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
            }
        } catch (SQLException e) {

        }
        return list;
    }
    
    //feedback
    //service feedback

    /**
     *
     * @param comment
     * @param rate
     * @param patientID
     * @param serviceID
     */
    public void addComment(String comment, String rate, int patientID, String serviceID) {
        String sql = "INSERT INTO Service_Feedbacks ([content],[rate],[patient_id],service_id)\n"
                + "VALUES (?,?,?,?);";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, comment);
            ps.setString(2, rate);
            ps.setInt(3, patientID);
            ps.setString(4, serviceID);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    /**
     *
     * @param fid
     */
    public void deleteComment(int fid) {
        String sql = "delete from [Service_Feedbacks] where feedback_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, fid);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     *
     * @param id
     * @return
     */
    public List<ServiceFeedbacks> getAllComment(String id) {
        List<ServiceFeedbacks> list = new ArrayList<>();
        String sql = "SELECT [feedback_id]\n"
                + "      ,[content]\n"
                + "      ,[rate]\n"
                + "      , [Patients].[name]\n"
                + "      ,[service_id]\n"
                + "  FROM [HealthcareSystem].[dbo].[Service_Feedbacks] join [Patients] ON [Service_Feedbacks].[patient_id] = [Patients].[patient_id] where [service_id] = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ServiceFeedbacks(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5)));
            }
        } catch (SQLException e) {

        }
        return list;
    }

    /**
     *
     * @param patient_id
     * @param service_id
     * @return
     */
    public List<ServiceFeedbacks> checkPatientComment(int patient_id, String service_id) {
        List<ServiceFeedbacks> list = new ArrayList<>();
        String sql = "SELECT TOP (1000) [feedback_id]\n"
                + "      ,[content]\n"
                + "      ,[rate]\n"
                + "      ,[patient_id]\n"
                + "      ,[service_id]\n"
                + "  FROM [HealthcareSystem].[dbo].[Service_Feedbacks] where [patient_id] = ? and [service_id] = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, patient_id);
            ps.setString(2, service_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ServiceFeedbacks(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5)));
            }
        } catch (SQLException e) {

        }
        return list;
    }

    /**
     *
     * @param service_id
     * @return
     */
    public int averageRateServices(String service_id) {
        int average = 0;
        String sql = "SELECT ROUND(AVG([rate]),0)\n"
                + "FROM [Service_Feedbacks]\n"
                + "where [service_id] = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, service_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                average = rs.getInt(1);
            }
        } catch (SQLException e) {

        }
        return average;
    }
    
    /**
     *
     * @param id
     * @param star
     * @return
     */
    public List<ServiceFeedbacks> getAllCommentSortedByStar(String id,String star) {
        List<ServiceFeedbacks> list = new ArrayList<>();
        String sql = "SELECT [feedback_id]\n"
                + "      ,[content]\n"
                + "      ,[rate]\n"
                + "      , [Patients].[name]\n"
                + "      ,[service_id]\n"
                + "  FROM [HealthcareSystem].[dbo].[Service_Feedbacks] join [Patients] ON [Service_Feedbacks].[patient_id] = [Patients].[patient_id] where [service_id] = ? and rate = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, star);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ServiceFeedbacks(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5)));
            }
        } catch (SQLException e) {

        }
        return list;
    }
    
    /**
     *
     * @param comment
     * @param rate
     * @param feedbackID
     */
    public void editComment(String comment, String rate, String feedbackID) {
        String sql = "update Service_Feedbacks set content = ?, rate=?\n"
                + " where feedback_id=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, comment);
            ps.setString(2, rate);
            ps.setString(3, feedbackID);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    /**
     *
     * @param args
     */
    public static void main(String[] args) {
        ServicesDAO dao = new ServicesDAO();
//        List<Specialities> list = dao.getAllSpecialities();
        List<Services> listS = dao.getAllServicesSortedDownPrice();
        System.out.println(listS);
    }
}
