package com.language.message;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.language.message.bo.MessageBO;
import com.language.user.bo.UserBO;


@RequestMapping("/message") // 클라이언트가 요청한 URL path와 일치하는 메소드가 수행된다.
@RestController
public class MessageRestController {

		@Autowired 
		private MessageBO messageBO;
		
		@Autowired
		private UserBO userBO;
		
		
	   // 메세지 보내기 
	   @PostMapping("/create")
	   public Map<String, Object> create(
			   @RequestParam("receiverId") int receiverId,
			   @RequestParam("content") String content,
			   HttpSession session){
		   
		   // 세션
		   Integer userId = (Integer)session.getAttribute("userId");
		   
		   Map<String, Object> result = new HashMap<>();
		   if (userId == null) {
			   result.put("code", 500);   // 비로그인 상태
			   result.put("result", "error");
			   result.put("errorMessage", "로그인을 해주세요.");
			   return result;
		   }
		   
		   messageBO.addMessage(userId, receiverId, content);
		   
		   result.put("code", 1);
		   result.put("result", "성공");
		   return result;
	   }
	   
	   
	   
	   
	   
	   
	  
	   // 메세지 삭제하기
	   @DeleteMapping("/delete")
	   public Map<String, Object> delete(
			   @RequestParam("messageId") int messageId,
			   HttpSession session){
		   
		   Map<String, Object> result = new HashMap<>();
			
			Integer userId = (Integer)session.getAttribute("userId");
			
			if (userId == null) {
				result.put("code", 500);
				result.put("errorMessage", "Please log in.");
				return result;
			}
					
			// db delete
				messageBO.deleteMessageById(messageId);
				result.put("code", 1);
				result.put("result", "Your comment has been deleted.");
		
			return result;
	   }

	
}