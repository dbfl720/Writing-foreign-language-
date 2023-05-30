package com.language.live_like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.language.live_like.bo.LiveLikeBO;

@RestController // like table에 가는 것 이기 때문에 LikeRestController 만듬
public class LiveLikeRestController {

	
	
	@Autowired
	private LiveLikeBO liveLikeBO;
	
	
	
	//  GET :  /like?postId=13      @RequestParam으로 받기.
	//  GET or POST: /like/13       @PathVariable으로 받기. (와일드카드) - URL 경로에 변수를 넣어주는 것
	@RequestMapping("/like/{liveId}")
	public Map<String, Object> liveLike(
			@PathVariable int liveId,
			HttpSession session){
		
		Map<String, Object> result = new HashMap<>();
		
		// 로그인 여부 체크
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			result.put("code", 300);
			result.put("errorMessage", "Please log in.");
			return result;
		}
		
		
		// BO 호출
		liveLikeBO.liveLikeToggle(liveId, userId);
		
		
		// 응답
		result.put("code", 1);
		result.put("result", "Your like is updated.");
		return result;
				
	}
}
