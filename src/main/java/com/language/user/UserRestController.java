package com.language.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.language.common.Encrypt;
import com.language.user.bo.UserBO;
import com.language.user.model.User;

@RequestMapping("/user") // 클라이언트가 요청한 URL path와 일치하는 메소드가 수행된다.
@RestController // 웹 주소로 요청하면, 웹사이트 View 화면이 아닌 json 같은 데이터를 응답값으로 보내준다.
public class UserRestController {
	
	
	@Autowired
	private UserBO userBO;
	
	
	
	
	/**
	 * 아이디 중복 확인 API
	 * @param loginId
	 * @return
	 */
	// 중복 체크
	@RequestMapping("/is_duplicated_id")
	public Map<String, Object> inDuplicatedId(
			@RequestParam("loginId") String loginId){
		
		Map<String, Object> result = new HashMap<>();
		
		// select
		User user = userBO.getUserByLoginId(loginId);
		
		if(user != null) {
			result.put("code", 1);
			result.put("result", true);
		} else {
			result.put("code", 1);
			result.put("result", false);
		}
		return result;
	}
	
	
	
	
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
		@RequestParam("selectNativeValue") String nativeCategoryId,
		@RequestParam("selectLanguageValue") String foreignCategoryId,
		@RequestParam("loginId") String loginId,
		@RequestParam("signup_password") String password,
		@RequestParam("email") String email,
		@RequestParam("selfIntroduction") String selfIntroduction,
		@RequestParam("languageGoals") String languageGoals,
		@RequestParam("file") MultipartFile file){

	  
		Encrypt en = new Encrypt();	
		// salt 생성
		String salt = en.getSalt();
		// 최종 password 생성
		String saltPassword = en.getEncrypt(password, salt);
		

		
		// db insert
		userBO.addUser(nativeCategoryId, foreignCategoryId, loginId, saltPassword, email, selfIntroduction, languageGoals, file);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
		
	}
	
	
}
