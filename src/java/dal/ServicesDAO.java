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
import model.Patient;
import model.ServiceFeedbacks;
import model.Services;
import model.Specialities;

/**
 *
 * @author admin
 */
public class ServicesDAO {

    PreparedStatement ps = null;
    ResultSet rs = null;
    PatientDAO dalPatient = new PatientDAO();
    DoctorDAO dalDoctor = new DoctorDAO();
    TimetableDAO dalTimetable = new TimetableDAO();

    DBContext dbc = new DBContext();
    Connection connection = null;

    /**
     *
     * @param id
     * @return
     */
    public Services getServiceByID(String id) throws SQLException {
        String sql = "select * from services\n"
                + "where service_id = ?";
        try {
            connection = dbc.getConnection();
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
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return null;
    }

    /**
     *
     * @param id
     * @return
     * @throws java.sql.SQLException
     */
    public List<Services> getTop4Last(String id) throws SQLException {
        List<Services> list = new ArrayList<>();
        String sql = "select * from services\n"
                + "where type_id = ?\n"
                + "order by service_id desc limit 4";
        try {
            connection = dbc.getConnection();
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
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return list;
    }

    /**
     *
     * @param id
     * @return
     * @throws java.sql.SQLException
     */
    public Specialities getSpecByID(String id) throws SQLException {
        String sql = "select * from specialities\n"
                + "where type_id = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);//truyen cau lenh len sql
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Specialities(rs.getInt(1),
                        rs.getString(2));
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
     * @param id
     * @throws java.sql.SQLException
     */
    public void delete(int id) throws SQLException {
        String sql = " delete from services where service_id=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
    }

    public List<Specialities> getAllSpecialities() throws SQLException {
        List<Specialities> list = new ArrayList<>();
        String sql = "select * from specialities";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Specialities(rs.getInt(1), rs.getString(2)));
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
     * @return @throws java.sql.SQLException
     */
    public List<Services> getAllServices() throws SQLException {
        List<Services> list = new ArrayList<>();
        String sql = "select service_id\n"
                + "      ,title\n"
                + "      ,specialities.name\n"
                + "      ,image\n"
                + "      ,description\n"
                + "      ,price\n"
                + "from services join specialities on services.type_id = specialities.type_id";
        try {
            connection = dbc.getConnection();
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
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return list;
    }

    public List<Services> getServicesByPage(List<Services> list, int begin, int end) {
        List<Services> listServicesByPage = new ArrayList<>();
        for (int i = begin; i < end; i++) {
            listServicesByPage.add(list.get(i));
        }
        return listServicesByPage;
    }

    /**
     *
     * @param name
     * @return
     * @throws java.sql.SQLException
     */
    public List<Services> getAllServicesSearched(String name) throws SQLException {
        List<Services> list = new ArrayList<>();
        String sql = "select service_id\n"
                + "      ,title\n"
                + "      ,specialities.name\n"
                + "      ,image\n"
                + "      ,description\n"
                + "      ,price\n"
                + "from services join specialities on services.type_id = specialities.type_id where title like ? or specialities.name like ?";
        try {
            connection = dbc.getConnection();
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
     * @return @throws java.sql.SQLException
     */
    public List<Services> getAllServicesSortedSpecialities() throws SQLException {
        List<Services> list = new ArrayList<>();
        String sql = "select service_id\n"
                + "      ,title\n"
                + "      ,specialities.name\n"
                + "      ,image\n"
                + "      ,description\n"
                + "      ,price\n"
                + "from services join specialities on services.type_id = specialities.type_id order by services.type_id asc";
        try {
            connection = dbc.getConnection();
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
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return list;
    }

    /**
     *
     * @return @throws java.sql.SQLException
     */
    public List<Services> getAllServicesSortedUpPrice() throws SQLException {
        List<Services> list = new ArrayList<>();
        String sql = "select service_id\n"
                + "      ,title\n"
                + "      ,specialities.name\n"
                + "      ,image\n"
                + "      ,description\n"
                + "      ,price\n"
                + "from services join specialities on services.type_id = specialities.type_id order by services.price desc";
        try {
            connection = dbc.getConnection();
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
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return list;
    }

    /**
     *
     * @return @throws java.sql.SQLException
     */
    public List<Services> getAllServicesSortedDownPrice() throws SQLException {
        List<Services> list = new ArrayList<>();
        String sql = "select service_id\n"
                + "      ,title\n"
                + "      ,specialities.name\n"
                + "      ,image\n"
                + "      ,description\n"
                + "      ,price\n"
                + "from services join specialities on services.type_id = specialities.type_id order by services.price asc";
        try {
            connection = dbc.getConnection();
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
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return list;
    }

    /**
     *
     * @param id
     * @return
     * @throws java.sql.SQLException
     */
    public List<Services> getAllServicesByTypeID(String id) throws SQLException {
        List<Services> list = new ArrayList<>();
        String sql = "select * from services where type_id=?";
        try {
            connection = dbc.getConnection();
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
     * @param listSpec
     * @return
     * @throws java.sql.SQLException
     */
    public List<Services> searchSpecialities(List<String> listSpec) throws SQLException {
        List<Services> list = new ArrayList<>();
        String sql = "select service_id\n"
                + "      ,title\n"
                + "      ,specialities.name\n"
                + "      ,image\n"
                + "      ,description\n"
                + "      ,price\n"
                + "from services join specialities on services.type_id = specialities.type_id where 1=1 ";
        if (listSpec != null && !listSpec.isEmpty()) {
            sql += "and (";
            for (int i = 0; i < listSpec.size(); i++) {
                sql += "specialities.name = '" + listSpec.get(i) + "' ";
                if (i < listSpec.size() - 1) {
                    sql += " or ";
                }
            }
            sql += ")";
        }
        System.out.println(sql);
        try {
            connection = dbc.getConnection();
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
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return list;
    }

    /**
     *
     * @return @throws java.sql.SQLException
     */
    public List<Services> getAllServiceDashboard() throws SQLException {
        List<Services> list = new ArrayList<>();
        String sql = "select services.service_id\n"
                + "      ,title\n"
                + "      ,type_id\n"
                + "      ,image\n"
                + "      ,(select AVG(rate)\n"
                + "        from service_feedbacks\n"
                + "        where service_id =services.service_id) as rate\n"
                + "      ,price\n"
                + "from services join service_feedbacks on services.service_id = service_feedbacks.service_id\n"
                + "group by services.service_id,title,type_id,image,price";
        try {
            connection = dbc.getConnection();
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
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return list;
    }

    /**
     *
     * @param id
     * @return
     */
    public List<ServiceFeedbacks> getAllComment(String id) throws SQLException {
        List<ServiceFeedbacks> list = new ArrayList<>();
        String sql = "SELECT feedback_id,content,rate, patient_id,service_id\n"
                + "FROM Service_Feedbacks\n"
                + "where service_id = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                ServiceFeedbacks s = new ServiceFeedbacks();
                s.setFeedback_id(rs.getInt(1));
                s.setContent(rs.getString(2));
                s.setRate(rs.getInt(3));
                Patient p = dalPatient.getPatientByPatientID(rs.getInt(4));
                s.setPatient(p);
                s.setService_id(rs.getInt(5));
                list.add(s);
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

    //feedback
    //service feedback
    /**
     *
     * @param comment
     * @param rate
     * @param patientID
     * @param serviceID
     */
    public void addComment(String comment, String rate, int patientID, String serviceID) throws SQLException {
        String sql = "INSERT INTO Service_Feedbacks (content,rate,patient_id,service_id)\n"
                + "VALUES (?,?,?,?);";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, comment);
            ps.setString(2, rate);
            ps.setInt(3, patientID);
            ps.setString(4, serviceID);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
    }

    /**
     *
     * @param fid
     * @throws java.sql.SQLException
     */
    public void deleteComment(int fid) throws SQLException {
        String sql = "delete from Service_Feedbacks where feedback_id = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, fid);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
    }

    /**
     *
     * @param id
     * @return
     * @throws java.sql.SQLException
     */
    /**
     *
     * @param patient_id
     * @param service_id
     * @return
     * @throws java.sql.SQLException
     */
    public List<ServiceFeedbacks> checkPatientComment(int patient_id, String service_id) throws SQLException {
        List<ServiceFeedbacks> list = new ArrayList<>();
        String sql = "SELECT feedback_id\n"
                + "      ,content\n"
                + "      ,rate\n"
                + "      ,patient_id\n"
                + "      ,service_id\n"
                + "  FROM Service_Feedbacks where patient_id = ? and service_id = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, patient_id);
            ps.setString(2, service_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                ServiceFeedbacks s = new ServiceFeedbacks();
                s.setFeedback_id(rs.getInt(1));
                s.setContent(rs.getString(2));
                s.setRate(rs.getInt(3));
                Patient p = dalPatient.getPatientByPatientID(rs.getInt(4));
                s.setPatient(p);
                s.setService_id(rs.getInt(5));
                list.add(s);
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
     * @param service_id
     * @return
     * @throws java.sql.SQLException
     */
    public int averageRateServices(String service_id) throws SQLException {
        int average = 0;
        String sql = "SELECT ROUND(AVG(rate),0)\n"
                + "FROM Service_Feedbacks\n"
                + "where service_id = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, service_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                average = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return average;
    }

    public int getServiceFeedbackDetail(String serFeed_id) throws SQLException {
        int average = 0;
        String sql = "select * from service_feedbacks\n"
                + "where feedback_id = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, serFeed_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                average = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return average;
    }

    /**
     *
     * @param id
     * @param star
     * @return
     * @throws java.sql.SQLException
     */
    public List<ServiceFeedbacks> getAllCommentSortedByStar(String id, String star) throws SQLException {
        List<ServiceFeedbacks> list = new ArrayList<>();
        String sql = "SELECT feedback_id,content,rate, patient_id ,service_id\n"
                + "FROM Service_Feedbacks\n"
                + "where service_id = ? and rate = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, star);
            rs = ps.executeQuery();
            while (rs.next()) {
                ServiceFeedbacks s = new ServiceFeedbacks();
                s.setFeedback_id(rs.getInt(1));
                s.setContent(rs.getString(2));
                s.setRate(rs.getInt(3));
                Patient p = dalPatient.getPatientByPatientID(rs.getInt(4));
                s.setPatient(p);
                s.setService_id(rs.getInt(5));
                list.add(s);
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
     * @param comment
     * @param rate
     * @param feedbackID
     * @throws java.sql.SQLException
     */
    public void editComment(String comment, String rate, String feedbackID) throws SQLException {
        String sql = "update Service_Feedbacks set content = ?, rate=?\n"
                + " where feedback_id=?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, comment);
            ps.setString(2, rate);
            ps.setString(3, feedbackID);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
    }

    public List<Services> getTop10BestService() throws SQLException {
        List<Services> list = new ArrayList<>();
        String sql = "select services.service_id\n"
                + "                      ,title\n"
                + "                      ,type_id\n"
                + "                      ,image\n"
                + "                      ,(select AVG(rate)\n"
                + "                        from service_feedbacks\n"
                + "                        where service_id =services.service_id) as rate\n"
                + "                      ,price\n"
                + "                from services join service_feedbacks on services.service_id = service_feedbacks.service_id\n"
                + "                group by services.service_id,title,type_id,image,price\n"
                + "                order by rate desc limit 10";
        try {
            connection = dbc.getConnection();
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
            ServicesDAO dao = new ServicesDAO();
            dao.delete(40);
        } catch (SQLException ex) {
            Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
