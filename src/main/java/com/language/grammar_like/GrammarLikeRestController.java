package com.language.grammar_like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.language.grammar_like.bo.GrammarLikeBO;

@RestController
public class GrammarLikeRestController {

	
	@Autowired
	private GrammarLikeBO grammarLikeBO;
	
	
	@RequestMapping("/like/{commentId}")
	public Map<String, Object> like (
			@PathVariable int commentId,
			HttpSession session) {
		
		
		Map<String, Object> result = new HashMap<>();
		
		// 로그인 여부 체크
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			result.put("code", 300);
			result.put("errorMessage", "Please log in.");
			return result;
		}
		
		
		// BO 호출
		grammarLikeBO.likeToggle(commentId, userId);
		
		
		// 응답
		result.put("code", 1);
		result.put("result", "Your like is updated.");
		return result;
		
	}
}
