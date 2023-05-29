package com.language.live;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.language.live.bo.LiveBO;

@RequestMapping("/live")  // 클라이언트가 요청한 URL path와 일치하는 메소드가 수행된다.
@RestController   // 웹 주소로 요청하면, 웹사이트 View 화면이 아닌 json 같은 데이터를 응답값으로 보내준다.
public class LiveRestController {

	
	
	@Autowired
	private LiveBO liveBO;
	
	
	
	// live 글쓰기
	@PostMapping("/create")
	public Map<String, Object> create(
			@RequestParam("selectLanguageValue") String  languageCategoryId,
			@RequestParam("content") String content,
			@RequestParam("file") MultipartFile file, 
			HttpSession session){
		
		// 세션
		int userId = (int)session.getAttribute("userId");
		String loginId = (String)session.getAttribute("loginId");
		
		// db
		int rowCount = liveBO.addLive(userId, languageCategoryId, content, file);
		
		
		// response
		Map<String, Object> result = new HashMap<>();
		if (rowCount > 0) {
			result.put("code", 1);
			result.put("result", "Your article has been uploaded.");
			
		} else {
			result.put("code", 500);
			result.put("errorMessage", "Update failed.");
		}
		
		return result;
	}
}
