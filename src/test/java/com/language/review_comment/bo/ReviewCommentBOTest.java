package com.language.review_comment.bo;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.language.review_comment.model.ReviewComment;
import com.language.review_comment.model.ReviewCommentView;

@SpringBootTest
class ReviewCommentBOTest {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Autowired
	ReviewCommentBO reviewCommentBO;
	
	
	
	//@Transactional
	//@Test
	void 리뷰코멘트리스트ByReviewId() {
		logger.info("###### 리뷰 코멘트 리스트 가져오기");
		List<ReviewComment> reviewCommentList = reviewCommentBO.getReviewCommentListByReviewId(3);
		assertNotNull(reviewCommentList);
	}
	
	
	//@Transactional
	//@Test
	void 리뷰코멘트쓰기() {
		logger.info("###### 리뷰 코멘트 쓰기");
		reviewCommentBO.addReviewComment(4, 4, "content");
		
	}	
	
	
	//@Transactional
	//@Test
	void 리뷰View코멘트리스트_가져오기 () {
		logger.info("###### 리뷰View코멘트리스트_가져오기 ");
		List<ReviewCommentView> reviewCommentView = reviewCommentBO.generateReviewCommentList(4);
		assertNotNull(reviewCommentView);
	}		
	
	
	
	
	//@Transactional
	//@Test
	void 리뷰코멘트삭제하기 () {
		logger.info("###### 리뷰코멘트삭제하기");
		int reviewCommentDelete = reviewCommentBO.deleteComment(5);
		assertNotNull(reviewCommentDelete);
	}
	
	
	//@Test
	void test() {
		fail("Not yet implemented");
	}

}
