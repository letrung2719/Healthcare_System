/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.List;
import model.Patient;
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
public class PatientDAOTest {
    
    public PatientDAOTest() {
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
     * Test of getPatientByAccountID method, of class PatientDAO.
     */
//    @Test
//    public void testGetPatientByAccountID() throws Exception {
//        System.out.println("getPatientByAccountID");
//        int accountID = 24;
//        PatientDAO instance = new PatientDAO();
//        Patient expResult = null;
//        Patient result = instance.getPatientByAccountID(accountID);
//        System.out.println(result);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//    }

    /**
     * Test of getPatientByPatientID method, of class PatientDAO.
     */
//    @Test
//    public void testGetPatientByPatientID() throws Exception {
//        System.out.println("getPatientByPatientID");
//        int patientID = 15;
//        PatientDAO instance = new PatientDAO();
//        Patient expResult = null;
//        Patient result = instance.getPatientByPatientID(patientID);
//        System.out.println(result);
//        assertEquals(expResult, result);
//        
//    }
//
//    /**
//     * Test of delete method, of class PatientDAO.
//     */
//    @Test
//    public void testDelete() throws Exception {
//        System.out.println("delete");
//        int id = 0;
//        PatientDAO instance = new PatientDAO();
//        instance.delete(id);
//        
//    }

//    /**
//     * Test of insertNewPatient method, of class PatientDAO.
//     */
//    @Test
//    public void testInsertNewPatient() throws Exception {
//        System.out.println("insertNewPatient");
//        Patient u = new Patient("ng van a", 1, "", "123123123", "", 20, "");
//        PatientDAO instance = new PatientDAO();
//        int result = instance.insertNewPatient(u);
//        int expResult = 1;
//        assertEquals(expResult, result);
//        
//    }
//
//    /**
//     * Test of getAllPatient method, of class PatientDAO.
//     */
//    @Test
//    public void testGetAllPatient() throws Exception {
//        System.out.println("getAllPatient");
//        PatientDAO instance = new PatientDAO();
//        List<Patient> expResult = null;
//        List<Patient> result = instance.getAllPatient();
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of editPatient method, of class PatientDAO.
//     */
    @Test
    public void testEditPatient() throws Exception {
        System.out.println("editPatient");
        Patient p = new Patient("ng van a", 1, "1998-10-20", "123123145", "", 20, "");
        PatientDAO instance = new PatientDAO();
        int expResult = 1;
        int result = instance.editPatient(p);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of main method, of class PatientDAO.
     */
  
    
}
