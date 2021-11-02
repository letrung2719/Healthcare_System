/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class Doctor implements Serializable{
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
    private static final long serialVersionUID = 6106269076155338045L;
    
    /**
     *
     */
    public Doctor() {
    }

    public Doctor(int doctorID) {
        this.doctorID = doctorID;
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
    
    /**
     *
     * @param doctorID
     * @param name
     * @param gender
     * @param dob
     * @param phone
     * @param email
     * @param role
     * @param spec
     * @param description
     * @param image
     * @param accountID
     */
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

    /**
     *
     * @return
     */
    public int getDoctorID() {
        return doctorID;
    }

    /**
     *
     * @param doctorID
     */
    public void setDoctorID(int doctorID) {
        this.doctorID = doctorID;
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
    public String getRole() {
        return role;
    }

    /**
     *
     * @param role
     */
    public void setRole(String role) {
        this.role = role;
    }

    /**
     *
     * @return
     */
    public Specialities getSpec() {
        return spec;
    }

    /**
     *
     * @param spec
     */
    public void setSpec(Specialities spec) {
        this.spec = spec;
    }

    /**
     *
     * @return
     */
    public String getDescription() {
        return description;
    }

    /**
     *
     * @param description
     */
    public void setDescription(String description) {
        this.description = description;
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

    @Override
    public String toString() {
        return "Doctor{" + "doctorID=" + doctorID + ", name=" + name + ", gender=" + gender + ", dob=" + dob + ", phone=" + phone + ", email=" + email + ", role=" + role + ", spec=" + spec + ", accountID=" + accountID + '}';
    } 
}
