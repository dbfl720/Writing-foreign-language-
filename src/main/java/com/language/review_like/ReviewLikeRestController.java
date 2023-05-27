package com.language.review_like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.language.review_like.bo.ReviewLikeBO;

@RestController
public class ReviewLikeRestController {

	
	@Autowired
	private ReviewLikeBO reviewLikeBO;
	
	@RequestMapping("/reviewLike/{reviewId}")
	public Map<String, Object> reviewLike (
			@PathVariable int reviewId,
			HttpSession session){
		
		
		Map<String, Object> result = new HashMap<>();
		
		// 로그인 여부
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			result.put("code", 300);
			result.put("errorMessage", "Please log in.");
			return result;
		}
		
		
		// BO 호출
		reviewLikeBO.likeToggle(reviewId, userId);
				
				
		// 응답
		result.put("code", 1);
		result.put("result", "Your like is updated.");
		return result;
	}
}
