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
public class TimeTable {
       private int slotID; 
       private String time;

    public TimeTable() {
    }

    public TimeTable(int slotID, String time) {
        this.slotID = slotID;
        this.time = time;
    }

    public int getSlotID() {
        return slotID;
    }

    public void setSlotID(int slotID) {
        this.slotID = slotID;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "TimeTable{" + "slotID=" + slotID + ", time=" + time + '}'+"\n";
    }
       
       
}
