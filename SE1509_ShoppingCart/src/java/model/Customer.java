
package model;


public class Customer {
    private int id;
    private String name;
    private double amount;
    private String username,password;
    public Customer() {
    }
    public Customer(int id, String name, double amount, 
            String username, String password) {
        this.id = id;
        this.name = name;
        this.amount = amount;
        this.username = username;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }
    
}
