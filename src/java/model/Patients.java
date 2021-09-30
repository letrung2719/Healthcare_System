package model;

public class Patients {
    private int patientID;
    private String name;
    private int gender;
    private String dob;
    private String phone;
    private String email;
    private int accountID;
    
    
    public Patients() {
    }

    public Patients(int userID, String name, int gender, String dob, String phone, String email,int accountID) {
        this.patientID = userID;
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.phone = phone;
        this.email = email;
        this.accountID = accountID;
        
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
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

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    @Override
    public String toString() {
        return "Patients{" + "patientID=" + patientID + ", name=" + name + ", gender=" + gender + ", dob=" + dob + ", phone=" + phone + ", email=" + email + ", username="  + accountID + '}';
    }

    
    

    
    
    
    
    
    
    
}
