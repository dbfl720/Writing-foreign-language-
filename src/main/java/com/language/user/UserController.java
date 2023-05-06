package com.language.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class UserController {

	/**
	 * 회원가입 화면 
	 * @param model
	 * @return
	 */
	//localhost/user/sign_up_view
		 @GetMapping("/sign_up_view")
		 public String signUpView(Model model) {
			 model.addAttribute("view", "user/signUp");   // 가운데 section 조각페이지 이렇게 세팅해랏 !  - singUp(jsp)에서 view변수로 사용 가능.
			 return "template/layout";
		 }
	
		 
		 
		 
		 
		 @GetMapping("/sign_in_view")
		 public String signInView(Model model) {
			 model.addAttribute("view", "user/signIn");
			 return "template/layout";
		 }
		 
}
