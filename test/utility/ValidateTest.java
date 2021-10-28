/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author admin
 */
public class ValidateTest {
    
    public ValidateTest() {
    }

    @Test
    public void testCheckPhone() {
        System.out.println("checkPhone");
        String phone = "0123456789";
        Validate instance = new Validate();
        boolean result = instance.checkPhone(phone);
        boolean expResult = true;
        assertEquals(expResult, result);
    }   
    
    @Test
    public void testCheckPhone2() {
        System.out.println("checkPhone");
        String phone = "abc";
        Validate instance = new Validate();
        boolean result = instance.checkPhone(phone);
        boolean expResult = true;
        assertNotEquals(expResult, result);
    } 
    
    @Test
    public void testCheckPhone3() {
        System.out.println("checkPhone");
        String phone = "";
        Validate instance = new Validate();
        boolean result = instance.checkPhone(phone);
        boolean expResult = true;
        assertNotEquals(expResult, result);
    } 
    
    @Test
    public void testCheckPhone4() {
        System.out.println("checkPhone");
        String phone = "12523763834657134";
        Validate instance = new Validate();
        boolean result = instance.checkPhone(phone);
        boolean expResult = true;
        assertNotEquals(expResult, result);
    } 
}
