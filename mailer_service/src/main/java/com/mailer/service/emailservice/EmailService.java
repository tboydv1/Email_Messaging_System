package com.mailer.service.emailservice;

import com.mailer.entities.Client;
import com.mailer.entities.Message;

public interface EmailService {

	
	public void sendSimpleMessage(Message message , Client recipient);
}
