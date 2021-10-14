package model;

public class Patient {
    private int patientID;
    private String name;
    private int gender;
    private String dob;
    private String phone;
    private String email;
    private int accountID;
    private String image ;
    
    public Patient() {
    }

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
    
    public Patient(String name, int gender, String dob, String phone, String email, int accountID ,String image) {
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.phone = phone;
        this.email = email;
        this.accountID = accountID;
        this.image = image;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getPatientID() {
        return patientID;
    }

    public void setPatientID(int patientID) {
        this.patientID = patientID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    @Override
    public String toString() {
        return "Patients{" + "patientID=" + patientID + ", name=" + name + ", gender=" + gender + ", dob=" + dob + ", phone=" + phone + ", email=" + email + ", accountID=" + accountID + '}';
    }

    

   

    
    

    
    
    
    
    
    
    
}
