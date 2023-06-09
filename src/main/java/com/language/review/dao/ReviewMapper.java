package com.language.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.language.review.model.Review;
import com.language.review.model.ReviewView;

@Repository
public interface ReviewMapper {

	
	// insert
	public int insertReview(
			@Param("userId") int userId,  // Mybatis의 SQL 문장에 다수의 파라미터를 전달할 때는 전달되는 변수들에 꼭 @Param 어노테이션을 붙여줘야한다.
			@Param("reviewCategoryId") String reviewCategoryId,
			@Param("languageCategoryId") String languageCategoryId,
			@Param("title") String title,
			@Param("rating") int rating,
			@Param("content") String content,
			@Param("ImagePath") String ImagePath);
	
	
	
	// select
	public List<Review> selectReviewListByLanguage(
			@Param("languageCategoryId") String languageCategoryId,
			@Param("direction") String direction,
			@Param("standardId") Integer standardId,
			@Param("limit") int limit);
	

	
	
	// select
	public int selectReviewListByLanguageSort(
			@Param("languageCategoryId") String languageCategoryId,
			@Param("sort") String sort);  
	
	
	
	// select
	public List<Review> selectReviewList();
	
	
	// select
	public int selectReviewCountByReviewIdUserId(@Param("userId") Integer userId);
	
	
	// select 
	public List<Review> selectReviewCountList();
	
	
	
	// select
	public Review selectReview(int reviewId);
	
	
	
	// update
	 public void updateReviewByUserId(
			 @Param("reviewId") int reviewId,
			 @Param("reviewCategoryId") String reviewCategoryId,
			 @Param("languageCategoryId") String languageCategoryId,
			 @Param("title") String title,
			 @Param("rating") int rating,
			 @Param("content") String content,
			 @Param("ImagePath") String ImagePath);

}
