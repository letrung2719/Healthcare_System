/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author admin
 */
public class EmailVerification {

    public static void sendMail(String recepient) throws MessagingException {
        System.out.println("Mail is sent...");
        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        
        String emailAccount = "doccure1206@gmail.com";
        String password = "doccuresystem";

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(emailAccount, password);
            }
        });

        Message message = prepareMessage(session, recepient, emailAccount);
        
        Transport.send(message);
        
        System.out.println("Send successfully!");
        
    }

    private static Message prepareMessage(Session session, String recepient, String emailAccount) {
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(emailAccount));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
            message.setSubject("Email Verification");
            message.setText("Verified Code: minhbeo");
            return message;
        } catch (MessagingException ex) {
            Logger.getLogger(EmailVerification.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static void main(String[] args) throws MessagingException {
        EmailVerification.sendMail("minhhahe150966@fpt.edu.vn");
    }
}
