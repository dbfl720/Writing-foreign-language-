package com.language.review_like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.language.review_like.dao.ReviewLikeMapper;

@Service
public class ReviewLikeBO {

	
	@Autowired
	private ReviewLikeMapper reviewLikeMapper;
	
	
	
	// insert - 좋아요 추가, 삭제 
		public void likeToggle(int reviewId, int userId) {
			// like 있는지 확인
			int likeCount = reviewLikeMapper.selectLikeCountByReviewIdOrUserId(reviewId, userId);
			if(likeCount > 0) {  // 제거
				reviewLikeMapper.deleteLikeByUserIdReviewId(reviewId, userId);
			} else { // 추가
				reviewLikeMapper.insertLike(reviewId, userId);			
			}
		}
		
		
		
		// 좋아요 했는지 존재 여부.
		public boolean existLike(int reviewId, Integer userId) {
			// 비로그인
			if (userId == null) {
				return false;
			}	
			// 로그인,   개수는 boolean이 될 수 없기 때문에 조건문 만들기. => 0보다 크면 ture.
			return reviewLikeMapper.selectLikeCountByReviewIdOrUserId(reviewId, userId) > 0;
		}
		
		
		
		// select - 좋아요 개수
		public int getLikeCountByReviewId (int reviewId) {
			return reviewLikeMapper.selectLikeCountByReviewIdOrUserId(reviewId, null);
		}
}
