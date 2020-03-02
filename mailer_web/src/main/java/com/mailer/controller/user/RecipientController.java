package com.mailer.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mailer.dao.ClientDao;
import com.mailer.entities.Client;

@RestController
public class RecipientController {

	
	@Autowired
	ClientDao clientDaoImpl;
	
	
	@RequestMapping("/all")
	public List<Client> showList() {
		
		return clientDaoImpl.findAll();
				
	}
}
