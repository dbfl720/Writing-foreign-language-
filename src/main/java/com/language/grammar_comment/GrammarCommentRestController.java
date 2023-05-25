package com.language.grammar_comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.language.grammar_comment.bo.GrammarCommentBO;
import com.language.grammar_comment.model.GrammarComment;

@RequestMapping("/grammar_comment")
@RestController
public class GrammarCommentRestController {

	
	@Autowired
	private GrammarCommentBO grammarCommentBO;
	
	
	
	@PostMapping("/create")
	public Map<String, Object> create( 
			@RequestParam("grammarId") int grammarId,
			@RequestParam("oldContent") String oldContent,
			@RequestParam("newContent") String newContent,
			HttpSession session){
				
		// 세션에서 정보 가져오기
		int userId = (int)session.getAttribute("userId");
		String loginId = (String)session.getAttribute("loginId");
		
		// db insert
		int rowCount = grammarCommentBO.addGrammarComment(grammarId, userId, oldContent, newContent);
		
		// 응답
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
	
	
	
	
	
	 
	 @GetMapping("/get")
	 public Map<String, Object> get(
			 @RequestParam("commentId") Integer commentId){
		 
		 Map<String, Object> result = new HashMap<>();
		 
		 // db
		 GrammarComment grammarComment = grammarCommentBO.getGrammarComment(commentId);
		 
		 if (grammarComment == null) {
				result.put("join", "please log in.");
			} else {
				result.put("grammarComment", grammarComment);

			}
			return result;
		 
	 }
	
	
	}

