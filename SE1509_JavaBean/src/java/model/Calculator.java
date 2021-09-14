/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author TrungLT
 */
public class Calculator implements Serializable {

    private double num1 = 0, num2 = 0;
    private String op = "+";
    private String result;

    public Calculator() {
    }

    public Calculator(double num1, double num2, String op, String result) {
        this.num1 = num1;
        this.num2 = num2;
        this.op = op;
        this.result = result;
    }

    public double getNum1() {
        return num1;
    }

    public void setNum1(double num1) {
        this.num1 = num1;
    }

    public double getNum2() {
        return num2;
    }

    public void setNum2(double num2) {
        this.num2 = num2;
    }

    public String getOp() {
        return op;
    }

    public void setOp(String op) {
        this.op = op;
    }

    public String getResult() {
        String rs = "";
        switch (op) {
            case "+":
                rs = "Addition: " + (num1 + num2);
                break;
            case "-":
                rs = "Subtraction: " + (num1 - num2);
                break;
            case "x":
                rs = "Multiplication: " + (num1 * num2);
                break;
            case "/":
                if (num2 != 0) {
                    rs = "Devision: " + (num1 / num2);
                }else{
                    rs = "Can't devide by zero!";
                }
                break;
        }
        return rs;
    }
}
