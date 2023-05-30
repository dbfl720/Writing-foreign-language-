package com.language.review_comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.language.review_comment.dao.ReviewCommentMapper;
import com.language.review_comment.model.ReviewComment;
import com.language.review_comment.model.ReviewCommentView;
import com.language.user.bo.UserBO;
import com.language.user.model.User;

@Service
public class ReviewCommentBO {

	// logger 
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	
	@Autowired
	private ReviewCommentMapper reviewCommentMapper;
	
	@Autowired
	private UserBO userBO;
	
	
	
	
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
	
	
	
	// select - 댓글쓴이를 알기 위해.
	public List<ReviewCommentView> generateReviewCommentList(int reviewId){
		
		// 결과 리스트
		List<ReviewCommentView> reviewCommentViewList = new ArrayList<>();
		
		// 해당 글 댓글 가져오기
		List<ReviewComment> reviewCommentList = reviewCommentMapper.selectReviewCommentListByReviewId(reviewId);
			
		
	
		// reviewComment => reviewCommentView
		for (ReviewComment reviewComment : reviewCommentList) {
			
			ReviewCommentView reviewCommentView = new ReviewCommentView();
			
			// 댓글 하나
			reviewCommentView.setReviewComment(reviewComment);
			
			
			// 댓글쓴이
			User user = userBO.getUserById(reviewComment.getUserId());
			reviewCommentView.setUser(user);
			
			
			// 결과 담기
			reviewCommentViewList.add(reviewCommentView);
			
		}
		
		return reviewCommentViewList;
	}
	
	
	// delete
	public int deleteComment (int commentId) {
		return reviewCommentMapper.deleteComment(commentId);
	}
}
