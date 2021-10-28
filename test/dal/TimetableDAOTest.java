/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import model.Timetable;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author admin
 */
public class TimetableDAOTest {

    public TimetableDAOTest() {
    }

    @Test
    public void testGetTimeBySlotID() throws Exception {
        System.out.println("getTimeBySlotID");
        int slotID = 1;
        TimetableDAO instance = new TimetableDAO();
        Timetable expResult = new Timetable(1, "7h - 8h");
        Timetable result = instance.getTimeBySlotID(slotID);
        assertEquals(expResult.getSlotID(), result.getSlotID());
        assertEquals(expResult.getTime(), result.getTime());
    }

    @Test
    public void testGetSlotByTime() throws Exception {
        System.out.println("getSlotByTime");
        String time = "7h - 8h";
        TimetableDAO instance = new TimetableDAO();
        Timetable expResult = new Timetable(1, "7h - 8h");;
        Timetable result = instance.getSlotByTime(time);
        assertEquals(expResult.getSlotID(), result.getSlotID());
        assertEquals(expResult.getTime(), result.getTime());
    }
}
