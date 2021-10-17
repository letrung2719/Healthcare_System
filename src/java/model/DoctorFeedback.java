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
public class DoctorFeedback {
    private int feedbackID;
    private Patient patient;
    private Doctor doctor;
    private int rate;
    private String content;

    public DoctorFeedback() {
    }

    public DoctorFeedback(int feedbackID, Patient patient, Doctor doctor, int rate, String content) {
        this.feedbackID = feedbackID;
        this.patient = patient;
        this.doctor = doctor;
        this.rate = rate;
        this.content = content;
    }

    public int getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
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

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "DoctorFeedback{" + "feedbackID=" + feedbackID + ", patient=" + patient.getPatientID() + ", doctor=" + doctor.getDoctorID() + ", rate=" + rate + '}';
    }
    
    
}
