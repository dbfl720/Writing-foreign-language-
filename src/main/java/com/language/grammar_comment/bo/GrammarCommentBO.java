package com.language.grammar_comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.language.grammar_comment.dao.GrammarCommentMapper;
import com.language.grammar_comment.model.GrammarComment;
import com.language.grammar_comment.model.GrammarCommentView;
import com.language.user.bo.UserBO;
import com.language.user.model.User;

@Service
public class GrammarCommentBO {

	
	@Autowired
	private GrammarCommentMapper grammarCommentMapper;
	
	@Autowired
	private UserBO userBO;
	
	
	
	// insert
	public int addGrammarComment(
		int grammarId,
		int userId,
		String oldContent,
		String newContent) {
		
		return grammarCommentMapper.insertGrammarComment(grammarId, userId, oldContent, newContent);
	}
	
	
	
	// select
	// 댓글쓴이를 알기 위해서 
	public List<GrammarCommentView> generateGrammarCommentList(int grammarId) {
		
		// 결과 리스트
		List<GrammarCommentView> grammarCommentViewList = new ArrayList<>();
		
		
		// 글에 해당하는 댓글 가져오기 
		List<GrammarComment> grammarCommentList = grammarCommentMapper.selectGrammarCommentListByGrammarId(grammarId);
		
		// grammarComment => grammarCommentView
		for (GrammarComment grammarComment : grammarCommentList) {
			
			GrammarCommentView grammarCommentView = new GrammarCommentView();
			
			// 댓글 하나
			grammarCommentView.setGrammarComment(grammarComment);
			
			// 댓글쓴이
			User user = userBO.getUserById(grammarComment.getUserId());
			grammarCommentView.setUser(user);
			
			
			// 결과 담기
			grammarCommentViewList.add(grammarCommentView);
			
		}
		
		return grammarCommentViewList;
	}
}
