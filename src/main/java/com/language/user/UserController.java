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
	 * 회원가입 화면 
	 * @param model
	 * @return
	 */
	//localhost/user/sign_up_view
		 @GetMapping("/sign_up_view")
		 public String signUpView(Model model, HttpSession session) {
			 
			 
			 model.addAttribute("view", "user/signUp");   // 가운데 section 조각페이지 이렇게 세팅해랏 !  - singUp(jsp)에서 view변수로 사용 가능.
			 return "template/layout";
		 }
	
		 
		 
		 
	//localhost/user/profile_view
		@GetMapping("/profile_view")
		public String profileView(Model model, HttpSession session) {
			
			int userId = (int)session.getAttribute("userId");
			User user = userBO.getUserById(userId);
			
			model.addAttribute("user", user);
			model.addAttribute("view", "user/profile");
			return "template/layout";
		}
		 
}
