package com.language.review;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/review")
@Controller
public class ReviewController {

	
	//localhost/review/review_list_view
	@GetMapping("/review_list_view")
	public String review_list_view(
			Model model) {
		
		model.addAttribute("view", "review/reviewList");
		return "template/layout";
	}
	
	
	
	
	//localhost/review/review_writing_view
	@GetMapping("/review_writing_view")
	public String review_writing_view(
			Model model) {
		
		
		model.addAttribute("view", "review/reviewWriting");
		return "template/layout";
	}
	
}
