package com.language.review.bo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.language.review.dao.ReviewMapper;
import com.language.review.model.Review;

@Service
public class ReviewBO {

	
	 private Logger logger = LoggerFactory.getLogger(this.getClass());
	 
	 
	 @Autowired
	 private ReviewMapper reviewMapper;
	 
	 
	 
	 // insert
	 public int addReview(
			 int userId, String reviewCategoryId,
			 String languageCategoryId, String title,
			 int rating, String content, String ImagePath) {
		 
		 if (ImagePath == null) {
			 logger.warn("[insert Review_ImagePath] Review_ImagePath is null. userId:{}", userId);
			 return 0;  // 메소드 종료. 
		 }
		 
		 return reviewMapper.insertReview(userId, reviewCategoryId, languageCategoryId, title, rating, content, ImagePath);
	 }
	 
	 
	 
	 // select
	 public List<Review> getReviewListByLanguage(String languageCategoryId){
		 
		 
		 
		 return reviewMapper.selectReviewListByLanguage(languageCategoryId);
		 
	 }
	 
	 
}