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
    private Timetable slot;
    private String description;
    private int status;

    public Appointment() {
    }

    public Appointment(int appointmentID, Patient patient, Doctor doctor, String date, Timetable slot, String description, int status) {
        this.appointmentID = appointmentID;
        this.patient = patient;
        this.doctor = doctor;
        this.date = date;
        this.slot = slot;
        this.description = description;
        this.status = status;
    }

    public Appointment(Patient patient, Doctor doctor, String date, Timetable slot, String description, int status) {
        this.patient = patient;
        this.doctor = doctor;
        this.date = date;
        this.slot = slot;
        this.description = description;
        this.status = status;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Appointment{" + "appointmentID=" + appointmentID + ", patient=" + patient + ", doctor=" + doctor + ", date=" + date + ", slot=" + slot + ", description=" + description + ", status=" + status + '}';
    }
}
