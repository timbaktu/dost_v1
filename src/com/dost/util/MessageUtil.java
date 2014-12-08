package com.dost.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.dost.hibernate.DbUser;

public class MessageUtil {

	public static void sendEmail(DbUser sender) {
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session session = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(
								"customersupport@yourdost.com", "T9iK)TF$YF");
					}
				});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("customersupport@yourdost.com"));
			message.setRecipients(Message.RecipientType.CC,
					InternetAddress.parse("satyajeet1234@gmail.com"));
			message.setSubject("Email from " + sender.getUsername());
			message.setText("Dear Counselor,"
					+ "\n There is a query from user " + sender.getUsername() + ". Please login to yourdost.com and handle this case..Thanks");

			Transport.send(message);
			System.out.println("Done");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}
