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
public class Doctor {
    private int doctorID;
    private String name;
    private int gender;
    private String dob;
    private String phone;
    private String email;
    private String role;
    private Specialities spec;
    private String description;
    private String image;
    private int accountID;
    public Doctor() {
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }
    

    public Doctor(int doctorID, String name, int gender, String dob, String phone, String email, String role, Specialities spec, String description, String image, int accountID) {
        this.doctorID = doctorID;
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.phone = phone;
        this.email = email;
        this.role = role;
        this.spec = spec;
        this.description = description;
        this.image = image;
        this.accountID = accountID;
    }

    public int getDoctorID() {
        return doctorID;
    }

    public void setDoctorID(int doctorID) {
        this.doctorID = doctorID;
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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Specialities getSpec() {
        return spec;
    }

    public void setSpec(Specialities spec) {
        this.spec = spec;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Doctor{" + "doctorID=" + doctorID + ", name=" + name + ", gender=" + gender + ", dob=" + dob + ", phone=" + phone + ", email=" + email + ", role=" + role + ", spec=" + spec + ", accountID=" + accountID + '}';
    }
 
    
    
    
    
}
