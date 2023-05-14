package com.language.grammar.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.language.grammar.dao.GrammarMapper;
import com.language.grammar.model.Grammar;
import com.language.grammar.model.GrammarView;
import com.language.user.bo.UserBO;
import com.language.user.model.User;


@Service
public class GrammarBO {

	@Autowired 
	private GrammarMapper grammarMapper;
	
	@Autowired
	private UserBO userBO;
	
	
	// insert
	public int addGrammar(int userId, String languageCategoryId, String title, String content) {
		
		return grammarMapper.insertGrammar(userId, languageCategoryId, title, content);
	}
	
	
	
	
	// select - grammar 글들 - 유저 정보 얻기 위해서. (로그인 아이디)
	public List<GrammarView> generateGrammarList(Integer userId) {
		
		// 결과 리스트
		List<GrammarView> grammarViewList = new ArrayList<>();
		
		// Grammar 글에 해당하는 loginId 
		List<User> userList = userBO.getGrammarUser();
		
		for (User userOne : userList) {
			GrammarView grammarView = new GrammarView();
			
			
			//** GrammarView 클래스의 필드 수만큼 똑같이 세팅.  
			
			
			// ** 유저 정보들 (로그인 아이디)
			User user = userBO.getUserByLoginId(userOne.getLoginId());
			grammarView.setUser(user);
			
			// 리스트 채우기
			grammarViewList.add(grammarView);
		}
		
		
		return grammarViewList;
	}
	

}
