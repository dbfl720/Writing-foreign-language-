package com.language.message;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.language.message.bo.MessageBO;
import com.language.message.entity.MessageEntity;
import com.language.message.entity.MessageView;
import com.language.user.bo.UserBO;



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
		List<MessageEntity> outbox = messageBO.getMessageListByReceiverId(userId);
		//List<MessageView> messageViewList = messageBO.generateMessageList(userId);
		
		
		//model.addAttribute("messageViewList",messageViewList);
		model.addAttribute("outbox",outbox);
		model.addAttribute("view", "message/message_list");
		return "template/layout";
	}
	

}
