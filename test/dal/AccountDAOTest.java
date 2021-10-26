/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.List;
import model.Account;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Admin
 */
public class AccountDAOTest {
    
    public AccountDAOTest() {
    }

    @Test
    public void testLogin() {
        System.out.println("login");
        String user = "patient1";
        String pass = "12345";
        AccountDAO instance = new AccountDAO();
        Account expResult = null;
        Account result = instance.login(user, pass);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

//    @Test
//    public void testGetAccountByID() {
//        System.out.println("getAccountByID");
//        int account_id = 0;
//        AccountDAO instance = new AccountDAO();
//        Account expResult = null;
//        Account result = instance.getAccountByID(account_id);
//        assertEquals(expResult, result);
//        fail("The test case is a prototype.");
//    }
//
//    @Test
//    public void testChangePassword() {
//        System.out.println("changePassword");
//        String password = "";
//        int account_id = 0;
//        AccountDAO instance = new AccountDAO();
//        int expResult = 0;
//        int result = instance.changePassword(password, account_id);
//        assertEquals(expResult, result);
//        fail("The test case is a prototype.");
//    }
//
//    @Test
//    public void testGetNewestAccount() {
//        System.out.println("getNewestAccount");
//        AccountDAO instance = new AccountDAO();
//        Account expResult = null;
//        Account result = instance.getNewestAccount();
//        assertEquals(expResult, result);
//        fail("The test case is a prototype.");
//    }
//
//    @Test
//    public void testGetAllAccount() {
//        System.out.println("getAllAccount");
//        AccountDAO instance = new AccountDAO();
//        List<Account> expResult = null;
//        List<Account> result = instance.getAllAccount();
//        assertEquals(expResult, result);
//        fail("The test case is a prototype.");
//    }
//
//    @Test
//    public void testInsertNewAccountPatient() {
//        System.out.println("insertNewAccountPatient");
//        String username = "";
//        String password = "";
//        AccountDAO instance = new AccountDAO();
//        instance.insertNewAccountPatient(username, password);
//        fail("The test case is a prototype.");
//    }
//
//    @Test
//    public void testCheckAccountExist() {
//        System.out.println("checkAccountExist");
//        String user = "";
//        AccountDAO instance = new AccountDAO();
//        Account expResult = null;
//        Account result = instance.checkAccountExist(user);
//        assertEquals(expResult, result);
//        fail("The test case is a prototype.");
//    }
//
//    @Test
//    public void testMain() {
//        System.out.println("main");
//        String[] args = null;
//        AccountDAO.main(args);
//        fail("The test case is a prototype.");
//    }
    
}
