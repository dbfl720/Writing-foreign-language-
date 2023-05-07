package com.language.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.language.common.Encrypt;
import com.language.common.EncryptUtils;
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
	
	
	
	/**
	 * 회원가입 
	 * @param nativeCategoryId
	 * @param foreignCategoryId
	 * @param loginId
	 * @param password
	 * @param email
	 * @param selfIntroduction
	 * @param languageGoals
	 * @param file
	 * @return
	 */
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

	  
//		Encrypt en = new Encrypt();	
//		// salt 생성
//		String salt = en.getSalt();
//		// 최종 password 생성
//		String saltPassword = en.getEncrypt(password, salt);
		
		
		// 비밀번호 해싱
		String hashedPassword = EncryptUtils.md5(password);

		
		// db insert
		userBO.addUser(nativeCategoryId, foreignCategoryId, loginId, hashedPassword, email,  selfIntroduction, languageGoals, file);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
		
	}
	
	
	
	
	
	// 로그인
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("signInId") String loginId,
			@RequestParam("signInPassword") String signInPassword,
			HttpServletRequest request) {
		
		
	
//		비밀번호 인증
//		SHA-256(입력받은 비밀번호 + 유저 디비 테이블의 Salt값) 과 유저테이블에 이미 생성된 해시 값이 같으면 인증 성공
//      로그인 할때 ID로 salt값을 조회하여 입력한 비밀번호와 Salt값을 다시 암호화하여 비밀번호 체킹.		
		
		// password hashing
		String hashedPassword = EncryptUtils.md5(signInPassword);
		
		// select null or 1행   // ** select - hashedPassword로 해야함.
		User user = userBO.getUserByLoginIdPassword(loginId, hashedPassword);
				
				
		// 로그인 처리
		Map<String, Object> result = new HashMap<>();
		if (user != null) {
			result.put("code", 1);
			result.put("result", "log-in succeed");
			
			
			// 세션에 유저 정보 
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("ImagePath", user.getImagePath());
		} else {
			result.put("code", 500);
			result.put("errorMessage", "This user does not exist.");
		}
		
		return result;
		
	}
	
	
	
	
	
}
