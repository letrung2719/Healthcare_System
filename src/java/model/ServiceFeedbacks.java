package model;

public class ServiceFeedbacks {

    private int feedback_id;
    private String content;
    private int rate;
    private Patient patient;
    private int service_id;

    public ServiceFeedbacks() {
    }

    public ServiceFeedbacks(int feedback_id, String content, int rate, Patient patient, int service_id) {
        this.feedback_id = feedback_id;
        this.content = content;
        this.rate = rate;
        this.patient = patient;
        this.service_id = service_id;
    }

    public int getFeedback_id() {
        return feedback_id;
    }

    public void setFeedback_id(int feedback_id) {
        this.feedback_id = feedback_id;
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

    public int getService_id() {
        return service_id;
    }

    public void setService_id(int service_id) {
        this.service_id = service_id;
    }

    @Override
    public String toString() {
        return "ServiceFeedbacks{" + "feedback_id=" + feedback_id + ", content=" + content + ", rate=" + rate + ", patient=" + patient + ", service_id=" + service_id + '}';
    }

    

}