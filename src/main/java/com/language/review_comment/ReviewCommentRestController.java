package com.language.review_comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.language.review.bo.ReviewBO;
import com.language.review_comment.bo.ReviewCommentBO;


@RequestMapping("/review_comment")
@RestController
public class ReviewCommentRestController {

	
	
	@Autowired
	private ReviewCommentBO reviewCommentBO;
	
	
	/**
	 * 리뷰 코멘트 쓰기
	 * @param reviewId
	 * @param content
	 * @param session
	 * @return
	 */
	@PostMapping("/create")
	public Map<String, Object> create(
			@RequestParam("reviewId") int reviewId,
			@RequestParam("content") String content,
			HttpSession session){
		
		// 세션
		int userId = (int)session.getAttribute("userId");
		
		// db
		int rowCount = reviewCommentBO.addReviewComment(reviewId, userId, content);
				
				
		// response
		Map<String, Object> result = new HashMap<>();
		 if (rowCount > 0) {
			 	result.put("code", 1);
				result.put("result", "Your comment is saved.");
				
		} else {
			result.put("code", 500);
			result.put("errorMessage", "Failed to save. Please contact the administrator.");
		}
		
		return result;
	}
	
	
	/**
	 * 리뷰 코멘트 삭제
	 * @param commentId
	 * @param session
	 * @return
	 */
	@DeleteMapping("/delete")
	public Map<String, Object> delete(
			@RequestParam("commentId") int commentId,
			HttpSession session){
		
		Map<String, Object> result = new HashMap<>();
		
		
		// db delete
		int rowCount = reviewCommentBO.deleteComment(commentId);
		
		if (rowCount > 0) {
			result.put("code", 1);
			result.put("result", "Your comment has been deleted.");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "Failed to save. Please contact the administrator.");
		}
		return result;
		
	}
}
