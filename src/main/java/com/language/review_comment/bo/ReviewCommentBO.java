package com.language.review_comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.language.review_comment.dao.ReviewCommentMapper;
import com.language.review_comment.model.ReviewComment;

@Service
public class ReviewCommentBO {

	
	@Autowired
	private ReviewCommentMapper reviewCommentMapper;
	
	
	// select
	public List<ReviewComment> getReviewCommentListByReviewId(Integer reviewId) {
		
		return reviewCommentMapper.selectReviewCommentListByReviewId(reviewId);
	}
	
	
	// insert
	public int addReviewComment(
			int reviewId,
			int userId,
			String content) {
		
		return reviewCommentMapper.insertReviewComment(reviewId, userId, content);
	}
}
