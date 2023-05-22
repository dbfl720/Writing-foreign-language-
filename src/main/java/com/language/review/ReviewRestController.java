package com.language.review;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.language.review.bo.ReviewBO;

@RequestMapping("/review") // 클라이언트가 요청한 URL path와 일치하는 메소드가 수행된다.
@RestController // 웹 주소로 요청하면, 웹사이트 View 화면이 아닌 json 같은 데이터를 응답값으로 보내준다.
public class ReviewRestController {

	
	@Autowired
	private ReviewBO reviewBO;
	
	
	@PostMapping("/create")
	public Map<String, Object> create(
			@RequestParam("selectTypeValue") String reviewCategoryId,
			@RequestParam("selectLanguageValue")String languageCategoryId,
			@RequestParam("title")String title,
			@RequestParam("selectRatingValue")int rating,
			@RequestParam("content")String content,
			@RequestParam("ImagePath")String ImagePath,
			HttpSession session){ // 유저정보는 중요하고 파라미터로 주고받으면 안되기 때문에, session통해서 꺼내기! 
		
		// session
		int userId = (int)session.getAttribute("userId");
		
		// update - db
		int rowCount = reviewBO.addReview(userId, reviewCategoryId, languageCategoryId, title, rating, content, ImagePath);
		
		// response
		Map<String, Object> result = new HashMap<>();
		if (rowCount > 0) {
			result.put("code", 1);
			result.put("result", "Your review is saved.");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "Failed to save. Please login.");
		}
		return result;
		
		
	}
}
