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

    /**
     *
     */
    public DoctorFeedbacks() {
    }

    /**
     *
     * @param feedbackID
     * @param date
     * @param content
     * @param rate
     * @param patient
     * @param doctor
     */
    public DoctorFeedbacks(int feedbackID, String date, String content, int rate, Patient patient, Doctor doctor) {
        this.feedbackID = feedbackID;
        this.date = date;
        this.content = content;
        this.rate = rate;
        this.patient = patient;
        this.doctor = doctor;
    }

    /**
     *
     * @param date
     * @param content
     * @param rate
     * @param patient
     * @param doctor
     */
    public DoctorFeedbacks(String date, String content, int rate, Patient patient, Doctor doctor) {
        this.date = date;
        this.content = content;
        this.rate = rate;
        this.patient = patient;
        this.doctor = doctor;
    }

    /**
     *
     * @return
     */
    public int getFeedbackID() {
        return feedbackID;
    }

    /**
     *
     * @param feedbackID
     */
    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
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
    public String getContent() {
        return content;
    }

    /**
     *
     * @param content
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     *
     * @return
     */
    public int getRate() {
        return rate;
    }

    /**
     *
     * @param rate
     */
    public void setRate(int rate) {
        this.rate = rate;
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

    @Override
    public String toString() {
        return "DoctorFeedbacks{" + "feedback_id=" + feedbackID + ", date=" + date + ", content=" + content + ", rate=" + rate + ", patient=" + patient + ", doctor=" + doctor + '}';
    }    
}
