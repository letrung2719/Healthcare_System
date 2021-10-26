/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

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
public class ReservationTest {
    
    public ReservationTest() {
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
     * Test of getReservationID method, of class Reservation.
     */
    @Test
    public void testGetReservationID() {
        System.out.println("getReservationID");
        Reservation instance = new Reservation();
        int expResult = 0;
        int result = instance.getReservationID();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setReservationID method, of class Reservation.
     */
    @Test
    public void testSetReservationID() {
        System.out.println("setReservationID");
        int reservationID = 0;
        Reservation instance = new Reservation();
        instance.setReservationID(reservationID);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getDate method, of class Reservation.
     */
    @Test
    public void testGetDate() {
        System.out.println("getDate");
        Reservation instance = new Reservation();
        String expResult = "";
        String result = instance.getDate();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setDate method, of class Reservation.
     */
    @Test
    public void testSetDate() {
        System.out.println("setDate");
        String date = "";
        Reservation instance = new Reservation();
        instance.setDate(date);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getPatient method, of class Reservation.
     */
    @Test
    public void testGetPatient() {
        System.out.println("getPatient");
        Reservation instance = new Reservation();
        Patient expResult = null;
        Patient result = instance.getPatient();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setPatient method, of class Reservation.
     */
    @Test
    public void testSetPatient() {
        System.out.println("setPatient");
        Patient patient = null;
        Reservation instance = new Reservation();
        instance.setPatient(patient);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getService method, of class Reservation.
     */
    @Test
    public void testGetService() {
        System.out.println("getService");
        Reservation instance = new Reservation();
        Services expResult = null;
        Services result = instance.getService();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setService method, of class Reservation.
     */
    @Test
    public void testSetService() {
        System.out.println("setService");
        Services service = null;
        Reservation instance = new Reservation();
        instance.setService(service);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getPrice method, of class Reservation.
     */
    @Test
    public void testGetPrice() {
        System.out.println("getPrice");
        Reservation instance = new Reservation();
        double expResult = 0.0;
        double result = instance.getPrice();
        assertEquals(expResult, result, 0.0);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setPrice method, of class Reservation.
     */
    @Test
    public void testSetPrice() {
        System.out.println("setPrice");
        double price = 0.0;
        Reservation instance = new Reservation();
        instance.setPrice(price);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getStatus method, of class Reservation.
     */
    @Test
    public void testGetStatus() {
        System.out.println("getStatus");
        Reservation instance = new Reservation();
        int expResult = 0;
        int result = instance.getStatus();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setStatus method, of class Reservation.
     */
    @Test
    public void testSetStatus() {
        System.out.println("setStatus");
        int status = 0;
        Reservation instance = new Reservation();
        instance.setStatus(status);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getSlot method, of class Reservation.
     */
    @Test
    public void testGetSlot() {
        System.out.println("getSlot");
        Reservation instance = new Reservation();
        Timetable expResult = null;
        Timetable result = instance.getSlot();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setSlot method, of class Reservation.
     */
    @Test
    public void testSetSlot() {
        System.out.println("setSlot");
        Timetable slot = null;
        Reservation instance = new Reservation();
        instance.setSlot(slot);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getDescription method, of class Reservation.
     */
    @Test
    public void testGetDescription() {
        System.out.println("getDescription");
        Reservation instance = new Reservation();
        String expResult = "";
        String result = instance.getDescription();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setDescription method, of class Reservation.
     */
    @Test
    public void testSetDescription() {
        System.out.println("setDescription");
        String description = "";
        Reservation instance = new Reservation();
        instance.setDescription(description);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of toString method, of class Reservation.
     */
    @Test
    public void testToString() {
        System.out.println("toString");
        Reservation instance = new Reservation();
        String expResult = "";
        String result = instance.toString();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of main method, of class Reservation.
     */
    @Test
    public void testMain() {
        System.out.println("main");
        String[] args = null;
        Reservation.main(args);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
