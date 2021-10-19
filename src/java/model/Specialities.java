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
public class Specialities implements Serializable{
    private int type_id;
    private String name;
    private static final long serialVersionUID = 6106269076155338045L;

    /**
     *
     */
    public Specialities() {
    }

    /**
     *
     * @param type_id
     * @param name
     */
    public Specialities(int type_id, String name) {
        this.type_id = type_id;
        this.name = name;
    }

    /**
     *
     * @return
     */
    public int getType_id() {
        return type_id;
    }

    /**
     *
     * @param type_id
     */
    public void setType_id(int type_id) {
        this.type_id = type_id;
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

    @Override
    public String toString() {
        return "Specialities{" + "type_id=" + type_id + ", name=" + name + "}\n";
    }
    
}
