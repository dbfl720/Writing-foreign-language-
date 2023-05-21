package com.language.grammar_like.bo;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
class GrammarLikeBOTest {

	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Autowired
	GrammarLikeBO grammarLikeBO;
	
	
	//@Transactional
	//@Test
	void 좋아요_추가삭제() {
		logger.info("###### 좋아요 추가 삭제");
		grammarLikeBO.likeToggle(12, 12);
	}


	
	//@Transactional
	//@Test
	void 좋아요_존재여부() {
		logger.info("###### 좋아요 존재 여부");
		grammarLikeBO.existLike(12, 12);
		
	}
	
	
	//@Transactional
	//@Test
	void 좋아요_개수() {
		logger.info("###### 좋아요 개수 여부");
		int number = grammarLikeBO.getLikeCountByCommentId(12);
		assertNotNull(number);
	}
}
