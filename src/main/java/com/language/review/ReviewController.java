package com.language.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.language.review.bo.ReviewBO;
import com.language.review.model.Review;
import com.language.review.model.ReviewView;

@RequestMapping("/review")
@Controller
public class ReviewController {

	
	@Autowired
	private ReviewBO reviewBO;
	
	
	
	
	
	
	//localhost/review/review_list_view
	@GetMapping("/review_list_view")
	public String review_list_view(
			@RequestParam(value="languageCategoryId", defaultValue="EN") String languageCategoryId,
			Model model, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");

		
		// db
		List<Review> reviewList = reviewBO.getReviewListByLanguage(languageCategoryId);
		List<ReviewView> reviewViewList = reviewBO.generateReviewUserList(userId);
		
		
		model.addAttribute("reviewViewList", reviewViewList);
		model.addAttribute("reviewList", reviewList);
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
	
	
	
	
	//localhost/review/review_detail_view
	@GetMapping("/review_detail_view")
	public String review_detail_view(
			Model model) {
		
		
		model.addAttribute("view", "review/reviewDetail");
		return "template/layout";
	}
}
