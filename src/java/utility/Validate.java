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
    public boolean checkPhone(String phone){
        String regex = "\\d{10}";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(phone);
        return matcher.matches();
    }
    
    public static void main(String[] args) {
        Validate validate = new Validate();
        System.out.println(validate.checkPhone("asdfasdfasdf"));
    }
}
