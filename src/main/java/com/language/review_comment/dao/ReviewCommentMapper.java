package com.language.review_comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.language.review_comment.model.ReviewComment;

@Repository
public interface ReviewCommentMapper {

	// select
	public List<ReviewComment> selectReviewCommentListByReviewId(Integer reviewId);
	
	
	// insert
	public int insertReviewComment(
			@Param("reviewId") int reviewId,
			@Param("userId") int userId,
			@Param("content") String content);
			
	
}
