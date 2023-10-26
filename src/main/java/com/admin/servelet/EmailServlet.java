

package com.admin.servelet; // Corrected typo in package name

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

@WebServlet("/emailsending")
public class EmailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Sender's email and password
        final String senderEmail = "rajt34293@gmail.com";
        final String password = "rnadvralhfrlxegh"; // Use an App Password if 2-factor authentication is enabled

        // Recipient's email address
        HttpSession session = req.getSession();
       
        String name = req.getParameter("username");
        String recipientemail = req.getParameter("email"); // Get the email address from the form or another source

        // Check the payment mode (cash on delivery or card payment)
        String paymentMode = req.getParameter("payment");

        if (recipientemail != null && !recipientemail.isEmpty()) {
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            
            // Create a Session with the email and password
            Session session2 = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(senderEmail, password);
                }
            });

            try {
                // Create a MimeMessage object
                Message message = new MimeMessage(session2);

                // Set the sender and recipient
                message.setFrom(new InternetAddress(senderEmail));
                message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipientemail));

                // Set the email subject and content based on the payment mode
                if ("CARD PAYMENT".equals(paymentMode)) {
                    message.setSubject("Card Payment Confirmation");
                    message.setText("Hello " + name + ", Your card payment has been processed. Thank you for shopping with us!");
                } else if ("COD".equals(paymentMode)) {
                    // Handle cash on delivery specific logic here
                    message.setSubject("Cash on delivery Confirmation");
                    message.setText("Hello " + name + ", Your order has been confirmed. Thank you for shopping with us!");
                }

                // Send the email
                Transport.send(message);

                // Log success (consider using a logging framework instead of printing to the console)
                System.out.print("if");

                // Redirect to the appropriate order confirmation page
                if ("CARD PAYMENT".equals(paymentMode)) {
                    resp.sendRedirect("order_success.jsp");
                } else if("COD".equals(paymentMode)){
                    resp.sendRedirect("order_success.jsp");
                }
               
            } catch (MessagingException e) {
                // Log the error (consider using a logging framework instead of printing to the console)
                e.printStackTrace();
                throw new ServletException("Error sending email", e);
            }
        } else {
            System.out.print("else");
        }
    }
}



