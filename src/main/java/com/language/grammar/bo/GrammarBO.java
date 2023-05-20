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
import com.language.grammar_comment.bo.GrammarCommentBO;
import com.language.grammar_comment.model.GrammarCommentView;
import com.language.grammar_like.bo.GrammarLikeBO;
import com.language.user.bo.UserBO;
import com.language.user.model.User;


@Service
public class GrammarBO {
	
	// *** logger 
	private Logger logger = LoggerFactory.getLogger(this.getClass());  

	
	private static final int POST_MAX_SIZE = 6; // 페이지 수 바꿀 때 여기 숫자만 바꾸면 됨.
	
	
	
	@Autowired 
	private GrammarMapper grammarMapper;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private GrammarCommentBO grammarCommentBO;
	
	
	
	
	
	// insert
	public int addGrammar(int userId, String languageCategoryId, String title, String content) {
		
		return grammarMapper.insertGrammar(userId, languageCategoryId, title, content);
	}
	
	
	
	
	
	// select 
	public List<Grammar> getGrammarListByLanguage(String languageCategoryId, Integer prevId, Integer nextId) {
		
	
		String direction = null;     // 방향
		Integer standardId = null;   // 기준 grammarId
		if (prevId != null) { // 이전
			direction = "prev";
			standardId = prevId;
		
		// Grammar 글들
		List<Grammar> grammarList = grammarMapper.selectGrammarListByLanguage(languageCategoryId, direction, standardId, POST_MAX_SIZE);   // ** breakpoint
		// 가져온 리스트를 뒤집는다. 5 6 7 => 7 6 5 
		Collections .reverse(grammarList); // void - 저장까지 해준다. 
	
		return grammarList;
		
		} else if (nextId != null) {
			direction = "next";
			standardId = nextId;
		}
		
		return grammarMapper.selectGrammarListByLanguage(languageCategoryId, direction, standardId, POST_MAX_SIZE);
	}
	
	
	
	
	
	// 이전 방향의 끝인지 확인
	public boolean isPrevLastPage(String languageCategoryId, int prevId) {
		int grammarId = grammarMapper.selectGrammarListByLanguageSort(languageCategoryId, "DESC");
		return grammarId == prevId;  // 같으면 끝이고 아니면 끝 아님.    prevId ? true : false
	}
	
	
	// 다음 방향의 끝인지 확인
	public boolean isNextLastPage(String languageCategoryId, int nextId) {
		return nextId == grammarMapper.selectGrammarListByLanguageSort(languageCategoryId, "ASC");
	}
	
	
	
	
	
	
	
	
	// select 
	public List<GrammarView> generateGrammarList(int grammarId, Integer userId) {
		
		// 결과 리스트
		List<GrammarView> grammarViewList = new ArrayList<>(); // ** breakpoint
		
		
		
		// Grammar 글
		List<Grammar> grammarList = grammarMapper.selectGrammarList();
		
		// Grammar => GrammarView 담기.
		for (Grammar grammar : grammarList) {
			
			GrammarView grammarView = new GrammarView();
				
			
			// ** GrammarView 클래스의 필드 수만큼 똑같이 세팅. 
			// 그래머 글 하나
			grammarView.setGrammar(grammar);
			
			// 글쓴이 정보
			User user = userBO.getUserById(grammar.getUserId());
			grammarView.setUser(user);

			// 댓글들
			List<GrammarCommentView> grammarCommentList = grammarCommentBO.generateGrammarCommentList(grammarId, userId);  // 오류 - grammar.getId()
			grammarView.setGrammarCommentViewList(grammarCommentList);
			
			
			
			// 결과 담기
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
