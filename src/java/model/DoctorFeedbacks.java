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
public class DoctorFeedbacks {
    private int feedbackID;
    private String date;
    private String content;
    private int rate;
    private Patient patient;
    private Doctor doctor;

    public DoctorFeedbacks() {
    }

    public DoctorFeedbacks(int feedbackID, String date, String content, int rate, Patient patient, Doctor doctor) {
        this.feedbackID = feedbackID;
        this.date = date;
        this.content = content;
        this.rate = rate;
        this.patient = patient;
        this.doctor = doctor;
    }

    public DoctorFeedbacks(String date, String content, int rate, Patient patient, Doctor doctor) {
        this.date = date;
        this.content = content;
        this.rate = rate;
        this.patient = patient;
        this.doctor = doctor;
    }

    public int getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
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

    @Override
    public String toString() {
        return "DoctorFeedbacks{" + "feedback_id=" + feedbackID + ", date=" + date + ", content=" + content + ", rate=" + rate + ", patient=" + patient + ", doctor=" + doctor + '}';
    }    
}
