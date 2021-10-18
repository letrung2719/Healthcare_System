package model;

/**
 *
 * @author admin
 */
public class ServiceFeedbacksAd {

    private int feedback_id;
    private String content;
    private int rate;
    private String image;
    private String patient;
    private int service_id;

    /**
     *
     */
    public ServiceFeedbacksAd() {
    }

    /**
     *
     * @param feedback_id
     * @param content
     * @param rate
     * @param image
     * @param patient
     * @param service_id
     */
    public ServiceFeedbacksAd(int feedback_id, String content, int rate, String image, String patient, int service_id) {
        this.feedback_id = feedback_id;
        this.content = content;
        this.rate = rate;
        this.image = image;
        this.patient = patient;
        this.service_id = service_id;
    }

    /**
     *
     * @return
     */
    public int getFeedback_id() {
        return feedback_id;
    }

    /**
     *
     * @param feedback_id
     */
    public void setFeedback_id(int feedback_id) {
        this.feedback_id = feedback_id;
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
    public String getImage() {
        return image;
    }

    /**
     *
     * @param image
     */
    public void setImage(String image) {
        this.image = image;
    }

    /**
     *
     * @return
     */
    public String getPatient() {
        return patient;
    }

    /**
     *
     * @param patient
     */
    public void setPatient(String patient) {
        this.patient = patient;
    }

    /**
     *
     * @return
     */
    public int getService_id() {
        return service_id;
    }

    /**
     *
     * @param service_id
     */
    public void setService_id(int service_id) {
        this.service_id = service_id;
    }

    @Override
    public String toString() {
        return "ServiceFeedbacks{" + "feedback_id=" + feedback_id + ", content=" + content + ", rate=" + rate + ", image=" + image + ", patient=" + patient + ", service_id=" + service_id + '}';
    }

    

}