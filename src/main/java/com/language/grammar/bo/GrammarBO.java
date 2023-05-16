package com.language.grammar.bo;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.language.grammar.dao.GrammarMapper;
import com.language.grammar.model.Grammar;
import com.language.grammar.model.GrammarView;
import com.language.user.bo.UserBO;
import com.language.user.model.User;


@Service
public class GrammarBO {
	
	// *** logger 
	private Logger logger = LoggerFactory.getLogger(this.getClass());  

	
	
	
	@Autowired 
	private GrammarMapper grammarMapper;
	
	@Autowired
	private UserBO userBO;
	
	
	
	
	// insert
	public int addGrammar(int userId, String languageCategoryId, String title, String content) {
		
		return grammarMapper.insertGrammar(userId, languageCategoryId, title, content);
	}
	
	
	
	
	
	// select - grammar 글들 - 글쓴이(loginId)를 알기 위해. 
	public List<GrammarView> generateGrammarListByLanguage(String languageCategoryId) {
		
		// 결과 리스트
		List<GrammarView> grammarViewList = new ArrayList<>(); // ** breakpoint
		
		// Grammar 글들
		List<Grammar> grammarList = grammarMapper.selectGrammarListByLanguage(languageCategoryId);
		
		// Grammar => GrammarView 담기.
		for (Grammar grammar : grammarList) {
			
			GrammarView grammarView = new GrammarView();
				
			
			// ** GrammarView 클래스의 필드 수만큼 똑같이 세팅. 
			// 그래머 글 하나
			grammarView.setGrammar(grammar);
			
			// 글쓴이 (loginId) 
			User user = userBO.getUserById(grammar.getUserId());
			grammarView.setUser(user);
			
			// 리스트 채우기
			grammarViewList.add(grammarView);
		}
		
		
		return grammarViewList;
	}
	
	
	
	// select - grammar 글들 - 글쓴이(loginId)를 알기 위해. 
	public List<GrammarView> generateGrammarList() {
		
		// 결과 리스트
		List<GrammarView> grammarViewList = new ArrayList<>(); // ** breakpoint
		
		// Grammar 글들
		List<Grammar> grammarList = grammarMapper.selectGrammarList();
		
		// Grammar => GrammarView 담기.
		for (Grammar grammar : grammarList) {
			
			GrammarView grammarView = new GrammarView();
				
			
			// ** GrammarView 클래스의 필드 수만큼 똑같이 세팅. 
			// 그래머 글 하나
			grammarView.setGrammar(grammar);
			
			// 글쓴이 (loginId) 
			User user = userBO.getUserById(grammar.getUserId());
			grammarView.setUser(user);
			
			// 리스트 채우기
			grammarViewList.add(grammarView);
		}
		
		
		return grammarViewList;
	}
	
	
	
	
	// select
	public Grammar getGrammarByGrammarId (int grammarId) {
		return grammarMapper.selectGrammarByGrammarId(grammarId);
	}
	
	
	
	
	
	// delete
	public int deleteGrammarByGrammarIdUserId(
			int grammarId, int userId) {
		
		// 기존 글 가져오기
		Grammar grammar = getGrammarByGrammarId(grammarId);
		if (grammar == null) {
			logger.warn("[그래머 삭제] grammr is null. grammarId:{} ");
			return 0;
		}
		
		// db delete
		return grammarMapper.deleteGrammarByGrammarIdUserId(grammarId, userId);
	}

}
