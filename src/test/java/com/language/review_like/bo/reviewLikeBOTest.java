package com.language.review_like.bo;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;


@SpringBootTest
class reviewLikeBOTest {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Autowired
	ReviewLikeBO reviewLikeBO;
	
	
	//@Transactional
	//@Test
	void 좋아요추가삭제() {
		logger.info("####### 좋아요 추가 삭제 확인하기");
		reviewLikeBO.likeToggle(3, 6);
	}
	
	
	
	
	
	
	//@Transactional
	//@Test
	void 좋아요했는지존재여부() {
		logger.info("####### 좋아요 했는지 존재 여부");
		reviewLikeBO.existLike(4, 4);
	}
	
	
	
	
	
	//@Transactional
	//@Test
	void 좋아요개수() {
		logger.info("####### 좋아요 개수 확인");
		int getLikeCount = reviewLikeBO.getLikeCountByReviewId(3);
		assertNotNull(getLikeCount);
	}
	
	//@Test
	void test() {
		fail("Not yet implemented");
	}

}
