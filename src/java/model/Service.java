/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ASUS
 */
public class Service {
    private int serID;
    private String title;
    private int typeID;
    private String image;
    private String des;
    private int price;

    public Service() {
    }

    public Service(int serID, String title, int typeID, String image, String des, int price) {
        this.serID = serID;
        this.title = title;
        this.typeID = typeID;
        this.image = image;
        this.des = des;
        this.price = price;
    }

    public int getSerID() {
        return serID;
    }

    public void setSerID(int serID) {
        this.serID = serID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getTypeID() {
        return typeID;
    }

    public void setTypeID(int typeID) {
        this.typeID = typeID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Service{" + "serID=" + serID + ", title=" + title + ", typeID=" + typeID + ", image=" + image + ", des=" + des + ", price=" + price + '}';
    }
    
    
    
}
