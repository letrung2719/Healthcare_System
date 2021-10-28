/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbcontext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author admin
 */
public class DBContextTest {

    public DBContextTest() {
    }

    @Test
    public void testGetConnection() throws SQLException {
        try {
            System.out.println("getConnection");
            DBContext instance = new DBContext();
            String expResult = "";

            String condition = "allowPublicKeyRetrieval=true&verifyServerCertificate=false&useSSL=false&requireSSL=false";
            String serverName = "localhost";
            String portNumber = "3306";
            String dbName = "healthcare_system";
            String url = "jdbc:mysql://" + serverName + ":" + portNumber + "/" + dbName + "?" + condition;

            String username = "root";
            String password = "12345";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection result = DriverManager.getConnection(url, username, password);
            assertNotEquals(expResult, result.toString());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContextTest.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
