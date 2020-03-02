package com.mailer.email;

import com.mailer.entities.Client;
import com.mailer.entities.Message;

public interface EmailService {

	
	public void sendSimpleMessage(Message message , Client recipient);
}
