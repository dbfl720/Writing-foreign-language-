package com.language.review.bo;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.language.review.dao.ReviewMapper;
import com.language.review.model.Review;
import com.language.review.model.ReviewView;
import com.language.user.bo.UserBO;
import com.language.user.model.User;

@Service
public class ReviewBO {

	
	 private Logger logger = LoggerFactory.getLogger(this.getClass());
	 
	 
	 @Autowired
	 private ReviewMapper reviewMapper;
	 
	 @Autowired
	 private UserBO userBO;
	 
	 
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
	 
	 
	 
	 
	 // select
	 public List<Review> getReveiwList(){
		 
		 return reviewMapper.selectReviewList();
	 }
	 
	 
	 
	 
	 // select
	 public List<ReviewView> generateReviewUserList(Integer userId) {
		 
		 // 결과 리스트
		 List<ReviewView> reviewViewList = new ArrayList<>();
		 
		 // Reveiw 글들
		 List<Review> reviewList = reviewMapper.selectReviewList();
		 
		 
		 for (Review review : reviewList) {
			 
			 ReviewView reviewView = new ReviewView();
			 
			 
			 // 리뷰 글 하나
			 reviewView.setReview(review);
			 
			 // 유저 정보들
			 User user = userBO.getUserById(review.getUserId());
			 reviewView.setUser(user);
			 
			 // 리뷰 글 개수
			 reviewView.setReviewCount(getReviewCountByUserId(review.getId(),review.getUserId()));
			 
			 // 결과 담기
			 reviewViewList.add(reviewView);
			 
		 }
		 
		 return reviewViewList;
	 }
	 
	 
	 
	 
	 
	 // select - 개수 리턴
	 public int getReviewCountByUserId(int reviewId, Integer userId) {
		 return reviewMapper.selectReviewCountByReviewIdUserId(reviewId, userId);
	 }
	 
	 
}