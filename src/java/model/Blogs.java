/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author admin
 */
public class Blogs {
    private int blogID;
    private String title;
    private String date;
    private String image;
    private String description;

    /**
     *
     */
    public Blogs() {
    }

    /**
     *
     * @param blogID
     * @param title
     * @param date
     * @param image
     * @param description
     */
    public Blogs(int blogID, String title, String date, String image, String description) {
        this.blogID = blogID;
        this.title = title;
        this.date = date;
        this.image = image;
        this.description = description;
    }

    public Blogs(String title, String date, String image, String description) {
        this.title = title;
        this.date = date;
        this.image = image;
        this.description = description;
    }
    
    /**
     *
     * @return
     */
    public int getBlogID() {
        return blogID;
    }

    /**
     *
     * @param BlogID
     */
    public void setBlogID(int BlogID) {
        this.blogID = BlogID;
    }

    /**
     *
     * @return
     */
    public String getTitle() {
        return title;
    }

    /**
     *
     * @param title
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     *
     * @return
     */
    public String getDate() {
        return date;
    }

    /**
     *
     * @param date
     */
    public void setDate(String date) {
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy/MM/dd");
            SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
            Date date1 = formatter1.parse(date);
            String strDate = formatter.format(date1);
            String strDate2 = formatter2.format(date1);
            this.date = strDate;
            this.date = strDate2;
        } catch (ParseException ex) {
            System.out.println(ex);
        }
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

    @Override
    public String toString() {
        return "Blogs{" + "blogID=" + blogID + ", title=" + title + ", date=" + date + ", image=" + image + ", description=" + description + '}';
    }
}
    
    