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

    public Reservation() {
    }
    
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

    public Reservation(String date, Patient patient, Services service, double price, Timetable slot, String description) {
        this.date = date;
        this.patient = patient;
        this.service = service;
        this.price = price;
        this.slot = slot;
        this.description = description;
    }

    public int getReservationID() {
        return reservationID;
    }

    public void setReservationID(int reservationID) {
        this.reservationID = reservationID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");
            SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
            Date date1 = formatter1.parse(date);
            String strDate = formatter.format(date1);
            this.date = strDate;
        } catch (ParseException ex) {
            
        }
        
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Services getService() {
        return service;
    }

    public void setService(Services service) {
        this.service = service;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Timetable getSlot() {
        return slot;
    }

    public void setSlot(Timetable slot) {
        this.slot = slot;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Reservation{" + "reservationID=" + reservationID + ", date=" + date + ", patient=" + patient + ", service=" + service + ", price=" + price + ", status=" + status + ", slot=" + slot + "}\n";
    }
    
    
    
}
