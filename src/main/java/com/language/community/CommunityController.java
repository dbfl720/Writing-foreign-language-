package com.language.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.language.community.bo.CommunityBO;

@RequestMapping("/community")
@Controller
public class CommunityController {
	
	
	@Autowired
	private CommunityBO communtyBO;
	
//	//localhost/community/community_view
//	@GetMapping("/community_view")
//	public String communityView(Model model) {
//		
//		
//	
//		model.addAttribute("view", "community/community");
//		return "template/layout";
//	}
}
