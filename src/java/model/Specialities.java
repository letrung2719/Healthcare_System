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
public class Specialities {
    private int type_id;
    private String name;

    public Specialities() {
    }

    public Specialities(int type_id, String name) {
        this.type_id = type_id;
        this.name = name;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Specialities{" + "type_id=" + type_id + ", name=" + name + "}\n";
    }
    
}
