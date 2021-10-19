/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Admin
 */
public class Timetable {

    private int slotID;
    private String time;

    /**
     *
     */
    public Timetable() {
    }

    /**
     *
     * @param slotID
     * @param time
     */
    public Timetable(int slotID, String time) {
        this.slotID = slotID;
        this.time = time;
    }

    /**
     *
     * @return
     */
    public int getSlotID() {
        return slotID;
    }

    /**
     *
     * @param slotID
     */
    public void setSlotID(int slotID) {
        this.slotID = slotID;
    }

    /**
     *
     * @return
     */
    public String getTime() {
        return time;
    }

    /**
     *
     * @param time
     */
    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "TimeTable{" + "slotID=" + slotID + ", time=" + time + '}' + "\n";
    }
}
