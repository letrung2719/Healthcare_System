/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author admin
 */
public class ForgotPassword {

    public static final char[] CHARS = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a',
        'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
        't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
        'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
    static Random random = new Random();

    public String getNewPassword() {
        StringBuilder buffer = new StringBuilder();
        for (int i = 0; i < 9; i++) {// generate 6 digit and character  
            buffer.append(CHARS[random.nextInt(CHARS.length)]);
        }
        return buffer.toString();
    }

    private Message prepareMessage(Session session, String emailAccount, String recepient, String code) {
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(emailAccount));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
            message.setSubject("Doccure Reset Your Password");

            String htmlCode = "<body style=\"background-color: #e1e1e1; margin: 0 !important; padding: 0 !important;\">\n"
                    + "        <div style=\"display: none; font-size: 1px; color: #0de0fe; line-height: 1px; font-family: 'Lato', Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;\"> We're thrilled to have you here! Get ready to dive into your new account. </div>\n"
                    + "        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n"
                    + "            <tr>\n"
                    + "                <td bgcolor=\"#0de0fe\" align=\"center\">\n"
                    + "                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n"
                    + "                        <tr>\n"
                    + "                            <td align=\"center\" valign=\"top\" style=\"padding: 40px 10px 40px 10px;\"> </td>\n"
                    + "                        </tr>\n"
                    + "                    </table>\n"
                    + "                </td>\n"
                    + "            </tr>\n"
                    + "            <tr>\n"
                    + "                <td bgcolor=\"#0de0fe\" align=\"center\" style=\"padding: 0px 10px 0px 10px;\">\n"
                    + "                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n"
                    + "                        <tr>\n"
                    + "                            <td bgcolor=\"#ffffff\" align=\"center\" valign=\"top\" style=\"padding: 40px 20px 20px 20px; border-radius: 4px 4px 0px 0px; color: #0de0fe; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; letter-spacing: 4px; line-height: 48px;\">\n"
                    + "                                <h1 style=\"font-size: 48px; font-weight: 400; margin: 2;\">Reset Your Password!</h1> <img src=\"https://img.icons8.com/clouds/100/000000/handshake.png\" width=\"125\" height=\"120\" style=\"display: block; border: 0px;\" />\n"
                    + "                            </td>\n"
                    + "                        </tr>\n"
                    + "                    </table>\n"
                    + "                </td>\n"
                    + "            </tr>\n"
                    + "            <tr>\n"
                    + "                <td bgcolor=\"#e1e1e1\" align=\"center\" style=\"padding: 0px 10px 0px 10px;\">\n"
                    + "                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width: 600px;\">\n"
                    + "                        <tr>\n"
                    + "                            <td bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 20px 30px 40px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;\">\n"
                    + "                                <p style=\"margin: 0;\">You recently requested to reset your password for your Doccure Account.</p><br>\n"
                    + "                                <p style=\"margin: 0;\">This is your new password: <span style=\"font-weight: bold\">" + code + "</span>.</p><br>\n"
                    + "                                <p style=\"margin: 0;\">You must use this password to continue login process.</p><br>\n"
                    + "                                <hr>\n"
                    + "                                <p style=\"margin: 0; font-style: italic\">This is an automated email. Please do not reply to this email!</p>\n"
                    + "                            </td>\n"
                    + "                        </tr>\n"
                    + "                    </table>\n"
                    + "                </td>\n"
                    + "            </tr>\n"
                    + "        </table>\n"
                    + "    </body>";
            message.setContent(htmlCode, "text/html");
            return message;
        } catch (MessagingException ex) {
            Logger.getLogger(AccountVerification.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void sendMail(String recepient, String code) throws MessagingException {
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

        Message message = prepareMessage(session, emailAccount, recepient, code);
        Transport.send(message);

        System.out.println("Send successfully!");
    }

    public static void main(String[] args) throws MessagingException {
        ForgotPassword main = new ForgotPassword();
        main.sendMail("trunglthe151129@fpt.edu.vn", main.getNewPassword());
    }
}
