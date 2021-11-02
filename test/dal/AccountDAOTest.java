/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.List;
import model.Account;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Admin
 */
public class AccountDAOTest {
    
    public AccountDAOTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of login method, of class AccountDAO.
     */
    @Test
    public void testLogin() throws Exception {
        System.out.println("login");
        String user = "";
        String pass = "";
        AccountDAO instance = new AccountDAO();
        Account expResult = null;
        Account result = instance.login(user, pass);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAccountByID method, of class AccountDAO.
     */
    @Test
    public void testGetAccountByID() throws Exception {
        System.out.println("getAccountByID");
        int account_id = 0;
        AccountDAO instance = new AccountDAO();
        Account expResult = null;
        Account result = instance.getAccountByID(account_id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of changePassword method, of class AccountDAO.
     */
    @Test
    public void testChangePassword() throws Exception {
        System.out.println("changePassword");
        String password = "";
        int account_id = 0;
        AccountDAO instance = new AccountDAO();
        int expResult = 0;
        int result = instance.changePassword(password, account_id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getNewestAccount method, of class AccountDAO.
     */
    @Test
    public void testGetNewestAccount() throws Exception {
        System.out.println("getNewestAccount");
        AccountDAO instance = new AccountDAO();
        Account expResult = null;
        Account result = instance.getNewestAccount();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAllAccount method, of class AccountDAO.
     */
    @Test
    public void testGetAllAccount() throws Exception {
        System.out.println("getAllAccount");
        AccountDAO instance = new AccountDAO();
        List<Account> expResult = null;
        List<Account> result = instance.getAllAccount();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of insertNewAccountPatient method, of class AccountDAO.
     */
    @Test
    public void testInsertNewAccountPatient() throws Exception {
        System.out.println("insertNewAccountPatient");
        String username = "";
        String password = "";
        AccountDAO instance = new AccountDAO();
        instance.insertNewAccountPatient(username, password);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of checkAccountExist method, of class AccountDAO.
     */
    @Test
    public void testCheckAccountExist() throws Exception {
        System.out.println("checkAccountExist");
        String user = "";
        AccountDAO instance = new AccountDAO();
        Account expResult = null;
        Account result = instance.checkAccountExist(user);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of main method, of class AccountDAO.
     */
    @Test
    public void testMain() {
        System.out.println("main");
        String[] args = null;
        AccountDAO.main(args);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
