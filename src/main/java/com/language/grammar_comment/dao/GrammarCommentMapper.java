package com.language.grammar_comment.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface GrammarCommentMapper {

	//insert
	public int insertGrammarComment(
			@Param("grammarId") int grammarId,
			@Param("userId") int userId,
			@Param("oldContent") String oldContent,
			@Param("newContent") String newContent);
}

