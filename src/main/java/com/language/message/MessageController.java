package com.language.message;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/message")
@Controller
public class MessageController {

	
	
	// localhost/message/message_list
	@GetMapping("/message_list")
	public String message_list(
			Model model) {
		
		model.addAttribute("view", "message/message_list");
		return "template/layout";
	}
}
