package com.language.live_comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.language.live_comment.bo.LiveCommentBO;

@RequestMapping("/live_comment")
@RestController
public class LiveCommentRestController {

	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private LiveCommentBO liveCommentBO;
	
	
	@PostMapping("/create")
	public Map<String, Object> create(
			@RequestParam("liveId") int liveId,
			@RequestParam("content") String content,
			HttpSession session){
		
		
		// 세션
		int userId = (int)session.getAttribute("userId");  // breakpoint
		
		if (userId == 0) {
			logger.error("[########insert live_comment] liveId:{}, userId:{}", liveId, userId);
		}
		
		
		// db
		int rowCount = liveCommentBO.addLiveComment(liveId, userId, content);
		
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
	
	
	
	
	
	
	
	
	@PostMapping("/delete")
	public Map<String, Object> delete(
			@RequestParam("commentId") int commentId){
		
		// db
		int rowCount = liveCommentBO.deleteLiveComment(commentId);
		
		// response
		Map<String, Object> result = new HashMap<>();
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
