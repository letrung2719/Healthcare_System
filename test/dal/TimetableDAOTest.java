/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import model.Timetable;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author admin
 */
public class TimetableDAOTest {
    
    TimetableDAO db = new TimetableDAO();
    
    public TimetableDAOTest() {
    }

    @Test
    public void testGetTimeBySlotID() {
        System.out.println("getTimeBySlotID");
        Timetable expResult = new Timetable(1, "7h - 8h");
        Timetable result = db.getTimeBySlotID(1);
        assertEquals(expResult, result);
    }

    @Test
    public void testGetSlotByTime() {
        System.out.println("getSlotByTime");
        String time = "";
        TimetableDAO instance = new TimetableDAO();
        Timetable expResult = null;
        Timetable result = instance.getSlotByTime(time);
        assertEquals(expResult, result);
    }
}
