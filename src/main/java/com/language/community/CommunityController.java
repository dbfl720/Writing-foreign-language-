package com.language.community;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.language.community.bo.CommunityBO;
import com.language.community.model.CommunityView;

@RequestMapping("/community")
@Controller
public class CommunityController {
	
	
	@Autowired
	private CommunityBO communityBO;
	
	//localhost/community/community_view
	@GetMapping("/community_view")
	public String communityView(Model model, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		List<CommunityView> communityList = communityBO.generateCommunityList(userId);
		
		model.addAttribute("communityList", communityList);
		model.addAttribute("view", "community/communityView");
		return "template/layout";
	}
}
