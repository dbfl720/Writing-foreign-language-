package com.language.grammar_like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface GrammarLikeMapper {

	// insert
	public void insertLike(
			@Param("commentId") int commentId,
			@Param("userId") int userId);
	
	
	// select
	public int selectLikeCountByCommentIdOrUserId(
			@Param("commentId") int commentId,
			@Param("userId") Integer userId);
	
	
	// select
	public int selectLikeCountByUserId(int userId);
	
	
	// delete
	public int deleteLikeByUserIdCommentId(
			@Param("commentId")int commentId,
			@Param("userId")int userId);
}
