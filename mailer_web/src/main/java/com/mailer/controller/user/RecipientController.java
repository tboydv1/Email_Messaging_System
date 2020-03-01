package com.mailer.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RecipientController {

	@RequestMapping("/all")
	@ResponseBody
	public String showList() {
		
		return "Application running live";
				
	}
}
