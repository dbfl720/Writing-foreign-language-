package com.language.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.language.user.bo.UserBO;
import com.language.user.model.User;

@RequestMapping("/user")
@Controller
public class UserController {

	
	@Autowired
	private UserBO userBO;
	
	/**
	 * 회원가입 및 로그인 화면 
	 * @param model
	 * @return
	 */
	//localhost/user/sign_up_view
		 @GetMapping("/sign_up_view")
		 public String signUpView(Model model) {
			 
			 model.addAttribute("view", "user/signUp");   // 가운데 section 조각페이지 이렇게 세팅해랏 !  - singUp(jsp)에서 view변수로 사용 가능.
			 return "template/layout";
		 }
	
		
		 
		 
		 /**
		  * 로그아웃 화면
		  * @param session
		  * @return
		  */
		 //localhost/user/sign_out_view
		@RequestMapping("/sign_out_view")
		public String signOut(HttpSession session) {
			// 세션에 있는 모든 것을 비운다.
			session.removeAttribute("userId");
			session.removeAttribute("loginId");
			session.removeAttribute("ImagePath");
			
			// 로그인 화면으로 이동
			return "redirect:/user/sign_up_view";
		}
		 
		 
		
		
		 /**
		  * 프로필 화면
		  * @param model
		  * @param session
		  * @return
		  */
	//localhost/user/profile_view
		@GetMapping("/profile_view")
		public String profileView(Model model, HttpSession session) {
			
			int userId = (int)session.getAttribute("userId");
			User user = userBO.getUserById(userId);
			
			model.addAttribute("user", user);
			model.addAttribute("view", "user/profile");
			return "template/layout";
		}
		
		
		
		
		
		
		//localhost/user/community_view
		@GetMapping("/community_view")
		public String communityView(Model model) {
	
			model.addAttribute("view", "user/community");
			return "template/layout";
		}
		
		
		 
}
