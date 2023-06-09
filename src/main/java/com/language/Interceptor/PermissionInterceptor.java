package com.language.Interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PermissionInterceptor implements HandlerInterceptor {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws IOException {

		// 요청 URL을 가져온다.
		String uri = request.getRequestURI();
		logger.info("[$$$$$$$$$ preHandler] uri:{}", uri); // /user/sign_in_view

		// 로그인 여부 확인 - 세션 확인
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");

		// 비로그인 && /grammar로 온 경우 => 로그인 페이지로 리다이렉트, return false(기존 컨트롤러 수행 방지)
		if (userId == null && uri.startsWith("/grammar")) {
			response.sendRedirect("/user/sign_up_view");
			return false;

		}
		
		// 비로그인 && /review로 온 경우 => 로그인 페이지로 리다이렉트, return false(기존 컨트롤러 수행 방지)
		if (userId == null && uri.startsWith("/review")) {
			response.sendRedirect("/user/sign_up_view");
			return false;

		}
		
		
		// 비로그인 && /live로 온 경우 => 로그인 페이지로 리다이렉트, return false(기존 컨트롤러 수행 방지)
		if (userId == null && uri.startsWith("/live")) {
			response.sendRedirect("/user/sign_up_view");
			return false;

		}
		
		
		
		
		// 비로그인 && /message로 온 경우 => 로그인 페이지로 리다이렉트, return false(기존 컨트롤러 수행 방지)
		if (userId == null && uri.startsWith("/message")) {
			response.sendRedirect("/user/sign_up_view");
			return false;

		}
		


		return true; // 컨트롤러 수행

	}
	
	
	
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, 
			Object handler, ModelAndView mav) {
		
		// view 객체가 존재한다는 것은 아직 jsp가 HTML로 변환되기 전이다. 
		logger.info("[######### grammarHandle]");
	}
	
	
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response,
			Object handler, Exception ex) {
		// jsp가 HTML로 최종 변환된 후
		logger.info("[@@@@@@@@@@ afterCompletion]");
	}
}
