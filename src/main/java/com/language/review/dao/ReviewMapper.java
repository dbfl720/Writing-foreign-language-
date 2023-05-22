package com.language.review.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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
}
