package com.language.message;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.language.message.bo.MessageBO;
import com.language.message.entity.MessageView;
import com.language.user.bo.UserBO;
import com.language.user.model.User;



@RequestMapping("/message")
@Controller
public class MessageController {

	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private MessageBO messageBO;
	
	
	
	//localhost/message/message_view
	@GetMapping("/message_view")
	public String message_view(
			Model model, HttpSession session) {
		
		// session
		Integer userId = (Integer)session.getAttribute("userId");
		
		// db
		List<MessageView> messageViewList = messageBO.generateMessageList(userId);
		List<User> userList = userBO.getGrammarUser();
		
		model.addAttribute("userList",userList);
		model.addAttribute("messageViewList",messageViewList);
		model.addAttribute("view", "message/message_list");
		return "template/layout";
	}
	
	
	
	
	
	
	
	//localhost/message/message_outbox_view
		@GetMapping("/message_outbox_view")
		public String message_outbox_view(
				Model model, HttpSession session) {
			
			// session
			Integer userId = (Integer)session.getAttribute("userId");
			
			// db
			List<MessageView> messageViewOutBoxList = messageBO.generateOutBoxMessageList(userId);
			List<MessageView> messageViewList = messageBO.generateMessageList(userId);
			
			
			
		
			model.addAttribute("messageViewList",messageViewList);
			model.addAttribute("messageViewOutBoxList",messageViewOutBoxList);
			model.addAttribute("view", "message/message_outbox");
			return "template/layout";
		}
	

}
