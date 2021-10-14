package model;

public class Account {
    private int id;
    private String user;
    private String pass;
    private int author_id;
    private boolean status;

    public Account() {
    }

    public Account(int id, String user, String pass, int author_id, boolean status) {
        this.id = id;
        this.user = user;
        this.pass = pass;
        this.author_id = author_id;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getAuthor_id() {
        return author_id;
    }

    public void setAuthor_id(int author_id) {
        this.author_id = author_id;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", user=" + user + ", pass=" + pass + ", author_id=" + author_id + ", status=" + status + '}';
    }
}

