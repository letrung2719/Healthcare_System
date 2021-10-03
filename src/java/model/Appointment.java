/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author admin
 */
public class Appointment {

    private int appointmentID;
    private Patient patient;
    private Doctor doctor;
    private String date;
    private int slot;
    private String description;

    public Appointment() {
    }

    public Appointment(Patient patient, Doctor doctor, String date, int slot, String description) {
        this.patient = patient;
        this.doctor = doctor;
        this.date = date;
        this.slot = slot;
        this.description = description;
    }

    public Appointment(int appointmentID, Patient patient, Doctor doctor, String date, int slot, String description) {
        this.appointmentID = appointmentID;
        this.patient = patient;
        this.doctor = doctor;
        this.date = date;
        this.slot = slot;
        this.description = description;
    }

    public int getAppointmentID() {
        return appointmentID;
    }

    public void setAppointmentID(int appointmentID) {
        this.appointmentID = appointmentID;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getSlot() {
        return slot;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
