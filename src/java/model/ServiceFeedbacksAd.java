package model;

public class ServiceFeedbacksAd {

    private int feedback_id;
    private String content;
    private int rate;
    private String image;
    private String patient;
    private int service_id;

    public ServiceFeedbacksAd() {
    }

    public ServiceFeedbacksAd(int feedback_id, String content, int rate, String image, String patient, int service_id) {
        this.feedback_id = feedback_id;
        this.content = content;
        this.rate = rate;
        this.image = image;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPatient() {
        return patient;
    }

    public void setPatient(String patient) {
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
        return "ServiceFeedbacks{" + "feedback_id=" + feedback_id + ", content=" + content + ", rate=" + rate + ", image=" + image + ", patient=" + patient + ", service_id=" + service_id + '}';
    }

    

}