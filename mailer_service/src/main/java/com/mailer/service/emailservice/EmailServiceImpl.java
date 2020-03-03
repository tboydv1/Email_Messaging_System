package com.mailer.service.emailservice;

import com.mailer.service.ServiceProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import com.mailer.entities.Client;
import com.mailer.entities.Message;
import org.springframework.stereotype.Service;

import java.util.logging.Logger;


@Service
public class EmailServiceImpl implements EmailService {

	Logger log = Logger.getLogger(getClass().getName());

    @Autowired
    public JavaMailSender emailSender;

	@Override
	public void sendSimpleMessage(Message newMessage, Client recipient) {
		// TODO Auto-generated method stub
		
		  SimpleMailMessage message = new SimpleMailMessage(); 
		  
	        message.setTo(recipient.getEmail()); 
	        message.setSubject(newMessage.getSubject()); 
	        message.setText(newMessage.getBody());

	        try {

				emailSender.send(message);

	        }catch(RuntimeException ex){

	        	log.info("Error caught while sending email");
	        	ex.printStackTrace();

	        }

	        log.info("Email sent successfully!");

	}



	
}