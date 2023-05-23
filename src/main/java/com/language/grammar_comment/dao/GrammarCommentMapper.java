package com.language.grammar_comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.language.grammar_comment.model.GrammarComment;

@Repository
public interface GrammarCommentMapper {

	//insert
	public int insertGrammarComment(
			@Param("grammarId") int grammarId,
			@Param("userId") int userId,
			@Param("oldContent") String oldContent,
			@Param("newContent") String newContent);
	
	
	// select
	public List<GrammarComment> selectGrammarCommentListByGrammarId(int grammarId);
	
	
	// select
	public List<GrammarComment> selectGrammarCommentListByCommentId (Integer commentId);
	
	
	
	
	// select
	public GrammarComment selectGrammarComment (Integer commentId);
}

