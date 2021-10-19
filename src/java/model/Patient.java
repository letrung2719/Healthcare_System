package model;

import java.io.Serializable;

/**
 *
 * @author admin
 */
public class Patient implements Serializable{
    private int patientID;
    private String name;
    private int gender;
    private String dob;
    private String phone;
    private String email;
    private int accountID;
    private String image ;
    private static final long serialVersionUID = 6106269076155338045L;
    
    /**
     *
     */
    public Patient() {
    }

    /**
     *
     * @param patientID
     * @param name
     * @param gender
     * @param dob
     * @param phone
     * @param email
     * @param accountID
     * @param image
     */
    public Patient(int patientID, String name, int gender, String dob, String phone, String email, int accountID ,String image) {
        this.patientID = patientID;
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.phone = phone;
        this.email = email;
        this.accountID = accountID;
        this.image = image;
    }
    
    /**
     *
     * @param name
     * @param gender
     * @param dob
     * @param phone
     * @param email
     * @param accountID
     * @param image
     */
    public Patient(String name, int gender, String dob, String phone, String email, int accountID ,String image) {
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.phone = phone;
        this.email = email;
        this.accountID = accountID;
        this.image = image;
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
    public int getPatientID() {
        return patientID;
    }

    /**
     *
     * @param patientID
     */
    public void setPatientID(int patientID) {
        this.patientID = patientID;
    }

    /**
     *
     * @return
     */
    public String getName() {
        return name;
    }

    /**
     *
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     *
     * @return
     */
    public int getGender() {
        return gender;
    }

    /**
     *
     * @param gender
     */
    public void setGender(int gender) {
        this.gender = gender;
    }

    /**
     *
     * @return
     */
    public String getDob() {
        return dob;
    }

    /**
     *
     * @param dob
     */
    public void setDob(String dob) {
        this.dob = dob;
    }

    /**
     *
     * @return
     */
    public String getPhone() {
        return phone;
    }

    /**
     *
     * @param phone
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     *
     * @return
     */
    public String getEmail() {
        return email;
    }

    /**
     *
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     *
     * @return
     */
    public int getAccountID() {
        return accountID;
    }

    /**
     *
     * @param accountID
     */
    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    @Override
    public String toString() {
        return "Patients{" + "patientID=" + patientID + ", name=" + name + ", gender=" + gender + ", dob=" + dob + ", phone=" + phone + ", email=" + email + ", accountID=" + accountID + '}';
    }

    

   

    
    

    
    
    
    
    
    
    
}
