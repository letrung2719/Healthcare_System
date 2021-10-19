package model;

import java.io.Serializable;

/**
 *
 * @author admin
 */
public class Account implements Serializable{
    private int id;
    private String user;
    private String pass;
    private int author_id;
    private boolean status;
    private static final long serialVersionUID = 6106269076155338045L;
    
    /**
     *
     */
    public Account() {
    }

    /**
     *
     * @param id
     * @param user
     * @param pass
     * @param author_id
     * @param status
     */
    public Account(int id, String user, String pass, int author_id, boolean status) {
        this.id = id;
        this.user = user;
        this.pass = pass;
        this.author_id = author_id;
        this.status = status;
    }

    /**
     *
     * @return
     */
    public int getId() {
        return id;
    }

    /**
     *
     * @param id
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     *
     * @return
     */
    public String getUser() {
        return user;
    }

    /**
     *
     * @param user
     */
    public void setUser(String user) {
        this.user = user;
    }

    /**
     *
     * @return
     */
    public String getPass() {
        return pass;
    }

    /**
     *
     * @param pass
     */
    public void setPass(String pass) {
        this.pass = pass;
    }

    /**
     *
     * @return
     */
    public int getAuthor_id() {
        return author_id;
    }

    /**
     *
     * @param author_id
     */
    public void setAuthor_id(int author_id) {
        this.author_id = author_id;
    }

    /**
     *
     * @return
     */
    public boolean isStatus() {
        return status;
    }

    /**
     *
     * @param status
     */
    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", user=" + user + ", pass=" + pass + ", author_id=" + author_id + ", status=" + status + '}';
    }
}

