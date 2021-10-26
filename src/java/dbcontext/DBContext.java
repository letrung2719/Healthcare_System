package dbcontext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class DBContext {

    private final String condition = "allowPublicKeyRetrieval=true&verifyServerCertificate=false&useSSL=false&requireSSL=false";

    private String pass(String pass) {
        return pass;
    }

    /**
     *
     */
    protected Connection connection;

    /**
     *
     */
    public DBContext() {
        try {
            // Edit URL , username, password to authenticate with your MS SQL Server
            String serverName = "localhost";
            String portNumber = "3306";
            String dbName = "healthcare_system";
            String url = "jdbc:mysql://" + serverName + ":" + portNumber + "/" + dbName + "?" + condition;

            String username = "root";
            String password = "12345";
            Class.forName("com.mysql.cj.jdbc.Driver");

            connection = DriverManager.getConnection(url, username, pass(password));
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }

    /**
     *
     * @param args
     */
    public static void main(String[] args) {
        DBContext db = new DBContext();
        System.out.println(db.toString());
    }
}
