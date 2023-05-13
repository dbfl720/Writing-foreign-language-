package com.language.grammar;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.language.grammar.bo.GrammarBO;

@RequestMapping("/grammar")
@RestController  
public class GrammarRestController {

	
	@Autowired
	private GrammarBO grammarBO;
	
	
	@PostMapping("create")
	public Map<String, Object> create(
			@RequestParam("selectLanguageValue") String languageCategoryId,
			@RequestParam("title") String title,
			@RequestParam("content") String content,
			HttpSession session) {
		
		// 세션 정보 꺼내기
		int userId = (int)session.getAttribute("userId");
		
		
		// update db
		int rowCount = grammarBO.addGrammar(userId, languageCategoryId, title, content);
		
		// 응답 
		Map<String, Object> result = new HashMap<>();
		if (rowCount > 0) {
			result.put("code", 1);
			result.put("result", "Your writing is saved.");
			
		} else {
			result.put("code", 500);
			result.put("errorMessage", "Failed to save. Please log in.");
		}
		
		return result;
	}
}
