package com.language.community;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/community")
@Controller
public class CommunityController {
	
	
	//localhost/community/community_view
	@GetMapping("/community_view")
	public String communityView(Model model) {
		model.addAttribute("view", "community/community");
		return "template/layout";
	}
}
