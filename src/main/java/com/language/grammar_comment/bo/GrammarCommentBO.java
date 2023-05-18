package com.language.grammar_comment.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.language.grammar_comment.dao.GrammarCommentMapper;

@Service
public class GrammarCommentBO {

	
	@Autowired
	private GrammarCommentMapper grammarCommentMapper;
	
	// insert
	public int addGrammarComment(
		int grammarId,
		int userId,
		String oldContent,
		String newContent) {
		
		return grammarCommentMapper.insertGrammarComment(grammarId, userId, oldContent, newContent);
	}
	
}
