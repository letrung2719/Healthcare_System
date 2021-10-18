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

    /**
     *
     */
    public Appointment() {
    }

    /**
     *
     * @param appointmentID
     * @param patient
     * @param doctor
     * @param date
     * @param slot
     * @param description
     * @param status
     */
    public Appointment(int appointmentID, Patient patient, Doctor doctor, String date, Timetable slot, String description, int status) {
        this.appointmentID = appointmentID;
        this.patient = patient;
        this.doctor = doctor;
        this.date = date;
        this.slot = slot;
        this.description = description;
        this.status = status;
    }

    /**
     *
     * @param patient
     * @param doctor
     * @param date
     * @param slot
     * @param description
     * @param status
     */
    public Appointment(Patient patient, Doctor doctor, String date, Timetable slot, String description, int status) {
        this.patient = patient;
        this.doctor = doctor;
        this.date = date;
        this.slot = slot;
        this.description = description;
        this.status = status;
    }

    /**
     *
     * @return
     */
    public int getAppointmentID() {
        return appointmentID;
    }

    /**
     *
     * @param appointmentID
     */
    public void setAppointmentID(int appointmentID) {
        this.appointmentID = appointmentID;
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
    public Doctor getDoctor() {
        return doctor;
    }

    /**
     *
     * @param doctor
     */
    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
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

    @Override
    public String toString() {
        return "Appointment{" + "appointmentID=" + appointmentID + ", patient=" + patient + ", doctor=" + doctor + ", date=" + date + ", slot=" + slot + ", description=" + description + ", status=" + status + "}\n";
    }
}
