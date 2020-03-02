package com.mailer.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import com.mailer.entities.Client;
import com.mailer.entities.Message;



@Component
public class EmailServiceImpl implements EmailService {
  
    @Autowired
    public JavaMailSender emailSender;
 


	@Override
	public void sendSimpleMessage(Message newMessage, Client recipient) {
		// TODO Auto-generated method stub
		
		  SimpleMailMessage message = new SimpleMailMessage(); 
		  
	        message.setTo(recipient.getEmail()); 
	        message.setSubject(newMessage.getSubject()); 
	        message.setText(newMessage.getBody());
	        emailSender.send(message);
	}



	
}