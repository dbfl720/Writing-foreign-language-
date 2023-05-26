package com.language.review;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.language.review.bo.ReviewBO;
import com.language.review.model.Review;
import com.language.user.bo.UserBO;
import com.language.user.model.User;

@RequestMapping("/review") // 클라이언트가 요청한 URL path와 일치하는 메소드가 수행된다.
@RestController // 웹 주소로 요청하면, 웹사이트 View 화면이 아닌 json 같은 데이터를 응답값으로 보내준다.
public class ReviewRestController {

	
	@Autowired
	private ReviewBO reviewBO;
	
	@Autowired
	private UserBO userBO;
	
	/**
	 * review 쓰기
	 * @param reviewCategoryId
	 * @param languageCategoryId
	 * @param title
	 * @param rating
	 * @param content
	 * @param ImagePath
	 * @param session
	 * @return
	 */
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
	
	
	
	
	/**
	 * review ALERT 요청
	 * @param reviewId
	 * @return
	 */
	@GetMapping("/get")
	public Map<String, Object> get(
			@RequestParam("reviewId") int reviewId){
		
		Map<String, Object> result = new HashMap<>();
		
		// db
		Review review = reviewBO.getReview(reviewId);
		
		if (review == null) {
			result.put("join", "please log in.");
		} else {
			result.put("review", review);
		}
		return result;
	}
	
	
	
	
	// 리뷰 글 수정
	@PutMapping("/update")
	public Map<String, Object> update(
		@RequestParam("reviewId") int reviewId,
		@RequestParam("selectTypeValue") String reviewCategoryId,
		@RequestParam("selectLanguageValue")String languageCategoryId,
		@RequestParam("title")String title,
		@RequestParam("selectRatingValue")int rating,
		@RequestParam("content")String content,
		@RequestParam("ImagePath")String ImagePath,
		HttpSession session) {
			
		// 세션 정보 꺼내오기.
		int userId = (int)session.getAttribute("userId");
	
		
		// db
	    reviewBO.updateReview(reviewId, reviewCategoryId, languageCategoryId, title, rating, content, ImagePath);
		
		// response		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "update succeed");

		
		return result;
	}
	
	
}
