/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/**
 *
 * @author admin
 */
public class Validate {

    /**
     *
     * @param phone
     * @return
     */
    public boolean checkPhone(String phone){
        String regex = "\\d{10}";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(phone);
        return matcher.matches();
    }
    
    public boolean checkPassword(String pass){
        String regex = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\\S+$).{6,}";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(pass);
        return matcher.matches();
    }
    
    /**
     *
     * @param args
     */
    public static void main(String[] args) {
        Validate validate = new Validate();
        System.out.println(validate.checkPhone("asdfasdfasdf"));
    }
}
