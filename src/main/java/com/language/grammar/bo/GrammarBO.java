package com.language.grammar.bo;

import java.util.ArrayList;
import java.util.Collections;
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

	
	private static final int POST_MAX_SIZE = 3; // 페이지 수 바꿀 때 여기 숫자만 바꾸면 됨.
	
	
	
	@Autowired 
	private GrammarMapper grammarMapper;
	
	@Autowired
	private UserBO userBO;
	
	
	
	
	// insert
	public int addGrammar(int userId, String languageCategoryId, String title, String content) {
		
		return grammarMapper.insertGrammar(userId, languageCategoryId, title, content);
	}
	
	
	
	
	
	// select - grammar 글들 - 글쓴이(loginId)를 알기 위해. 
	public List<GrammarView> generateGrammarListByLanguage(String languageCategoryId, Integer prevId, Integer nextId) {
		
		// 결과 리스트
		List<GrammarView> grammarViewList = new ArrayList<>(); // ** breakpoint
		
		
		// 게시글 번호 : 10 9 8 | 7 6 5 | 4 3 2 | 1 
	    // 만약 4 3 2 페이지에 있을 때 
	    // 1) 다음 : 2보다 작은 3개 DESC 
		// 2) 이전 : 4보다 큰 3개 ASC(오름차순)(5 6 7) => List reverse(7 6 5)
	
		// 3) 만약 첫페이지일 때 (이전, 다음 없음) DESC 3개
		String direction = null;     // 방향
		Integer standardId = null;   // 기준 postId
		if (prevId != null) { // 이전
			direction = "prev";
			standardId = prevId;
		
		// Grammar 글들
		List<Grammar> grammarList = grammarMapper.selectGrammarListByLanguage(languageCategoryId, direction, standardId, POST_MAX_SIZE);   // ** breakpoint
		// 가져온 리스트를 뒤집는다. 5 6 7 => 7 6 5 
		Collections .reverse(grammarList); // void - 저장까지 해준다. 
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
		
			
		} else if (nextId != null) {  // 다음
			direction = "next";
			standardId = nextId;

		}
		return grammarMapper.selectGrammarListByLanguage(languageCategoryId, direction, standardId, POST_MAX_SIZE);
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
