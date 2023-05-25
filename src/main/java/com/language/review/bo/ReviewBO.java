package com.language.review.bo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.language.grammar.model.Grammar;
import com.language.review.dao.ReviewMapper;
import com.language.review.model.Review;
import com.language.review.model.ReviewView;
import com.language.user.bo.UserBO;
import com.language.user.model.User;

@Service
public class ReviewBO {

	
	 private Logger logger = LoggerFactory.getLogger(this.getClass());
	 
	 
	 private static final int POST_MAX_SIZE = 6; // 페이지 수 바꿀 때 여기 숫자만 바꾸면 됨.
	 
	 
	 
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
	 public List<Review> getReviewListByLanguage(String languageCategoryId, Integer prevId, Integer nextId){
		 
			String direction = null;     // 방향
			Integer standardId = null;   // 기준 grammarId
			if (prevId != null) { // 이전
				direction = "prev";
				standardId = prevId;
			
			// Grammar 글들
			List<Review> reviewList = reviewMapper.selectReviewListByLanguage(languageCategoryId, direction, standardId, POST_MAX_SIZE);   // ** breakpoint
			// 가져온 리스트를 뒤집는다. 5 6 7 => 7 6 5 
			Collections .reverse(reviewList); // void - 저장까지 해준다. 
		
			return reviewList;
			
			} else if (nextId != null) {
				direction = "next";
				standardId = nextId;
			}
			
			return reviewMapper.selectReviewListByLanguage(languageCategoryId, direction, standardId, POST_MAX_SIZE);
			
		 
	 }
	 
	 
	 
	// 이전 방향의 끝인지 확인
	public boolean isPrevLastPage(String languageCategoryId, int prevId) {
		int reviewId = reviewMapper.selectReviewListByLanguageSort(languageCategoryId, "DESC");
		return reviewId == prevId;  // 같으면 끝이고 아니면 끝 아님.    prevId ? true : false
	}
	
	
	// 다음 방향의 끝인지 확인
	public boolean isNextLastPage(String languageCategoryId, int nextId) {
		return nextId == reviewMapper.selectReviewListByLanguageSort(languageCategoryId, "ASC");
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
		 List<Review> reviewList = reviewMapper.selectReviewCountList();
		 
		 
		 for (Review review : reviewList) {
			 
			 ReviewView reviewView = new ReviewView();
			 
			 
			 // 리뷰 글 하나
			 reviewView.setReview(review);
			 
			 // 유저 정보들
			 User user = userBO.getUserById(review.getUserId());
			 reviewView.setUser(user);
			 
			 // 리뷰 글 개수
			 reviewView.setReviewCount(getReviewCountByUserId(review.getUserId()));
			 
			 // 결과 담기
			 reviewViewList.add(reviewView);
			 
		 }
		 
		 return reviewViewList;
	 }
	 
	 
	 
	 
	 
	 // select - 개수 리턴
	 public int getReviewCountByUserId(Integer userId) {
		 return reviewMapper.selectReviewCountByReviewIdUserId(userId);
	 }
	 
	 
	 
	 // select - 리뷰 글 개수 많은 순서대로.
	 public List<Review> getReviewCountList() {
		 return reviewMapper.selectReviewCountList();
	 }
	 
	 
	 
	 
	 // select
	 public Review getReview(int reviewId) {
		 return reviewMapper.selectReview(reviewId);
	 }

	 
}