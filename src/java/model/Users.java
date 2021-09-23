package model;

public class Users {
    private int userID;
    private String name;
    private int gender;
    private String dob;
    private String phone;
    private String email;

    public Users() {
    }

    public Users(int userID, String name, int gender, String dob, String phone, String email) {
        this.userID = userID;
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.phone = phone;
        this.email = email;
    }
    
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
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
        return "Users{" + "userID=" + userID + ", name=" + name + ", gender=" + gender + ", dob=" + dob + ", phone=" + phone + ", email=" + email + '}';
    }
    
    
    
    
    
    
}
