package com.language.message;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.language.user.bo.UserBO;
import com.language.user.model.User;



@RequestMapping("/message")
@Controller
public class MessageController {

	
	@Autowired
	private UserBO userBO;
	
	
	//localhost/message/message_view
	@GetMapping("/message_view")
	public String message_view(
			Model model, HttpSession session) {
		
		List<User> userList = userBO.getCommunityUser();
		
		model.addAttribute("userList",userList);
		model.addAttribute("view", "message/message_list");
		return "template/layout";
	}
	
	// localhost/message/message_chattingRoom
	@GetMapping("/message_chattingRoom")
	public String message_chattingRoom(
			Model model) {
		
		model.addAttribute("view", "message/message_chattingRoom");
		return "template/layout";
	}
}
