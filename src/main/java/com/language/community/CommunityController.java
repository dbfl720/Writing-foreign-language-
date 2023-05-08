package com.language.community;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.language.user.bo.UserBO;
import com.language.user.model.User;

@RequestMapping("/community")
@Controller
public class CommunityController {
	
	
	@Autowired
	private UserBO userBO;
	
	//localhost/community/community_view
	@GetMapping("/community_view")
	public String communityView(Model model, HttpSession session) {
		
		int userId = (int)session.getAttribute("userId");
		User user = userBO.getUserById(userId);
		
		model.addAttribute("user", user);
		model.addAttribute("view", "community/community");
		return "template/layout";
	}
}
