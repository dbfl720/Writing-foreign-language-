package com.language.review_like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ReviewLikeMapper {

	
	
	// insert
	public void insertLike(
			@Param("reviewId") int reviewId,
			@Param("userId") int userId);
	
	
	// select
	public int selectLikeCountByReviewIdOrUserId(
			@Param("reviewId") int reviewId,
			@Param("userId") Integer userId);
	
	
	// delete
	public int deleteLikeByUserIdReviewId(
			@Param("reviewId")int reviewId,
			@Param("userId")int userId);
}
