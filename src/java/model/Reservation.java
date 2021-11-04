 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class Reservation {
    private int reservationID; 
    private String date;
    private Patient patient;
    private Services service;
    private double price;
    private int status;
    private Timetable slot;
    private String description;

    /**
     *
     */
    public Reservation() {
    }
    
    /**
     *
     * @param reservationID
     * @param date
     * @param patient
     * @param service
     * @param price
     * @param status
     * @param slot
     * @param description
     */
    public Reservation(int reservationID, String date, Patient patient, Services service, double price, int status, Timetable slot, String description) {
        this.reservationID = reservationID;
        this.date = date;
        this.patient = patient;
        this.service = service;
        this.price = price;
        this.status = status;
        this.slot = slot;
        this.description = description;
    }

    /**
     *
     * @param date
     * @param patient
     * @param service
     * @param price
     * @param slot
     * @param description
     */
    public Reservation(String date, Patient patient, Services service, double price, Timetable slot, String description) {
        this.date = date;
        this.patient = patient;
        this.service = service;
        this.price = price;
        this.slot = slot;
        this.description = description;
    }

    /**
     *
     * @return
     */
    public int getReservationID() {
        return reservationID;
    }

    /**
     *
     * @param reservationID
     */
    public void setReservationID(int reservationID) {
        this.reservationID = reservationID;
    }

    /**
     *
     * @return
     */
    public String getDate() {
       
        return date;
    }

    /**
     *
     * @param date
     */
    public void setDate(String date) {    
        this.date = date;
    }

    /**
     *
     * @return
     */
    public Patient getPatient() {
        return patient;
    }

    /**
     *
     * @param patient
     */
    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    /**
     *
     * @return
     */
    public Services getService() {
        return service;
    }

    /**
     *
     * @param service
     */
    public void setService(Services service) {
        this.service = service;
    }

    /**
     *
     * @return
     */
    public double getPrice() {
        return price;
    }

    /**
     *
     * @param price
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     *
     * @return
     */
    public int getStatus() {
        return status;
    }

    /**
     *
     * @param status
     */
    public void setStatus(int status) {
        this.status = status;
    }

    /**
     *
     * @return
     */
    public Timetable getSlot() {
        return slot;
    }

    /**
     *
     * @param slot
     */
    public void setSlot(Timetable slot) {
        this.slot = slot;
    }

    /**
     *
     * @return
     */
    public String getDescription() {
        return description;
    }

    /**
     *
     * @param description
     */
    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Reservation{" + "reservationID=" + reservationID + ", date=" + date + ", patient=" + patient + ", service=" + service + ", price=" + price + ", status=" + status + ", slot=" + slot + "}\n";
    }
}
