/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.List;
import model.Appointment;
import model.Doctor;
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
public class AppointmentDAOTest {
    
    public AppointmentDAOTest() {
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
     * Test of addNewAppointment method, of class AppointmentDAO.
     */
    @Test
    public void testAddNewAppointment() throws Exception {
        System.out.println("addNewAppointment");
        Appointment a = null;
        AppointmentDAO instance = new AppointmentDAO();
        int expResult = 0;
        int result = instance.addNewAppointment(a);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAppointmentByID method, of class AppointmentDAO.
     */
    @Test
    public void testGetAppointmentByID() throws Exception {
        System.out.println("getAppointmentByID");
        int appID = 0;
        AppointmentDAO instance = new AppointmentDAO();
        Appointment expResult = null;
        Appointment result = instance.getAppointmentByID(appID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAllDoctorAppointment method, of class AppointmentDAO.
     */
    @Test
    public void testGetAllDoctorAppointment() throws Exception {
        System.out.println("getAllDoctorAppointment");
        int doctorID = 0;
        AppointmentDAO instance = new AppointmentDAO();
        int expResult = 0;
        int result = instance.getAllDoctorAppointment(doctorID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAppointmentAdmin method, of class AppointmentDAO.
     */
    @Test
    public void testGetAppointmentAdmin() throws Exception {
        System.out.println("getAppointmentAdmin");
        AppointmentDAO instance = new AppointmentDAO();
        List<Appointment> expResult = null;
        List<Appointment> result = instance.getAppointmentAdmin();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of paginateAppointmentByDoctorID method, of class AppointmentDAO.
     */
    @Test
    public void testPaginateAppointmentByDoctorID() throws Exception {
        System.out.println("paginateAppointmentByDoctorID");
        int doctorID = 0;
        int pageNumber = 0;
        int numberOfItem = 0;
        AppointmentDAO instance = new AppointmentDAO();
        List<Appointment> expResult = null;
        List<Appointment> result = instance.paginateAppointmentByDoctorID(doctorID, pageNumber, numberOfItem);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of changeAppointmentStatus method, of class AppointmentDAO.
     */
    @Test
    public void testChangeAppointmentStatus() throws Exception {
        System.out.println("changeAppointmentStatus");
        int appID = 0;
        int status = 0;
        AppointmentDAO instance = new AppointmentDAO();
        int expResult = 0;
        int result = instance.changeAppointmentStatus(appID, status);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAllAppointmentByDoctorID method, of class AppointmentDAO.
     */
    @Test
    public void testGetAllAppointmentByDoctorID() throws Exception {
        System.out.println("getAllAppointmentByDoctorID");
        Doctor d = null;
        AppointmentDAO instance = new AppointmentDAO();
        List<Appointment> expResult = null;
        List<Appointment> result = instance.getAllAppointmentByDoctorID(d);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of deleteAppointment method, of class AppointmentDAO.
     */
    @Test
    public void testDeleteAppointment() throws Exception {
        System.out.println("deleteAppointment");
        int appID = 0;
        AppointmentDAO instance = new AppointmentDAO();
        int expResult = 0;
        int result = instance.deleteAppointment(appID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of main method, of class AppointmentDAO.
     */
    @Test
    public void testMain() {
        System.out.println("main");
        String[] args = null;
        AppointmentDAO.main(args);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
