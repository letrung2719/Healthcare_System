/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.security.NoSuchAlgorithmException;
import java.security.MessageDigest;

/**
 *
 * @author admin
 */
public class PasswordEncrypt {

    public String generateEncryptedPassword(String password) {
        String encryptedpassword = null;

        try {
            /* MessageDigest instance for MD5. */
            MessageDigest m = MessageDigest.getInstance("MD5");

            /* Add plain-text password bytes to digest using MD5 update() method. */
            m.update(password.getBytes());

            /* Convert the hash value into bytes */
            byte[] bytes = m.digest();

            /* The bytes array has bytes in decimal form. Converting it into hexadecimal format. */
            StringBuilder s = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                s.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }

            /* Complete hashed password in hexadecimal format */
            encryptedpassword = s.toString();
        } catch (NoSuchAlgorithmException e) {
            System.out.println(e);
        }

        return encryptedpassword;
    }

    public static void main(String[] args) {
        PasswordEncrypt obj = new PasswordEncrypt();
        System.out.println(obj.generateEncryptedPassword("admin"));
    }
}
