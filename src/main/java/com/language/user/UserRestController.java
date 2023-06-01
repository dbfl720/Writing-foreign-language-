package com.language.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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

		// salt 생성
		String salt = Encrypt.getSalt();
		// 최종 password 생성
		String saltPassword = Encrypt.getEncrypt(password, salt);
		
		
		// db insert
		userBO.addUser(nativeCategoryId, foreignCategoryId, loginId, saltPassword, salt, email,  selfIntroduction, languageGoals, file);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
		
	}
	
	
	
	
	/**
	 * 로그인
	 * @param loginId
	 * @param signInPassword
	 * @param request
	 * @return
	 */
	// 로그인
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("signInId") String loginId,
			@RequestParam("signInPassword") String signInPassword,
			HttpServletRequest request) {
		
		
	
//		비밀번호 인증
//		SHA-256(입력받은 비밀번호 + 유저 디비 테이블의 Salt값)과 / 유저테이블에 이미 생성된 해시 값이 같으면 인증 성공
//      로그인 할때 ID로 salt값을 조회하여 입력한 비밀번호와 Salt값을 다시 암호화하여 비밀번호 체킹.	
		
		// db에서 salt 정보 가져오기 
		User prelogin = userBO.getUserByLoginId(loginId);
		// salt db
		String salt = prelogin.getSalt();
		// 최종 password make - 패스워드 + db 솔트 값 합치기 
		String saltPassword = Encrypt.getEncrypt(signInPassword, salt);
		
		
		// select null or 1행   // ** select - saltPassword로 해야함.
		User user = userBO.getUserByLoginIdPassword(loginId, saltPassword);
				
				
		// 로그인 처리
		Map<String, Object> result = new HashMap<>();
		if (user != null) {
			result.put("code", 1);
			result.put("result", "log-in succeed");
			
			
			// 세션에 유저 정보 
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("loginId", user.getLoginId());	
			session.setAttribute("ImagePath", user.getImagePath());
		} else {
			result.put("code", 500);
			result.put("errorMessage", "This user does not exist.");
		}
		
		return result;
		
	}
	
	
	
	
	
	
	/**
	 * 프로필 수정
	 * @param file
	 * @param selfIntroduction
	 * @param languageGoals
	 * @param session
	 * @return
	 */
	// 프로필 수정
	@PutMapping("/update")
	public Map<String, Object> update(
			@RequestParam("file") MultipartFile file,
			HttpSession session) {
		
		// 세션 정보 꺼내오기.
		int userId = (int)session.getAttribute("userId");
		String loginId = (String)session.getAttribute("loginId");
		User user = userBO.getUserByLoginId(loginId);
		
		// update  db
		userBO.updateUser(file, loginId, userId);
		
		// 응답 
		Map<String, Object> result = new HashMap<>();
		if (user != null) {
			result.put("code", 1);
			result.put("result", "update succeed");
			
		} else {
			result.put("code", 500);
			result.put("errorMessage", "Update failed.");
		}
		
		return result;
	}
	
	
	
	
	
	
	
	@GetMapping("getIntro")
	public Map<String, Object> getIntro(
			@RequestParam("userId") int userId){
		
		Map<String, Object> result = new HashMap<>();
		
		// db
		User user = userBO.getUserById(userId);
				
		if (user == null) {
			result.put("join", "Please log in.");
		} else {
			result.put("user", user);
		}
		return result;
	}
	
	
	
	
	
	@GetMapping("getGoals")
	public Map<String, Object> getGoals(
			@RequestParam("userId") int userId){
		
		Map<String, Object> result = new HashMap<>();
		
		// db
		User user = userBO.getUserById(userId);
				
		if (user == null) {
			result.put("join", "Please log in.");
		} else {
			result.put("user", user);
		}
		return result;
	}
}
