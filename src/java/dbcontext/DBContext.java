package dbcontext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class DBContext {
    
    private String pass(String pass){
        return pass;
    }
    
    /**
     *
     */
    protected Connection connection;

    /**
     *
     */
    public DBContext(){
        try {
            // Edit URL , username, password to authenticate with your MS SQL Server
            String url = "jdbc:mysql://localhost:3306/healthcare_system";
            String username = "root";
            String password = "trunglt27082001";
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