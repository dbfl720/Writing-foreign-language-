package com.language.live_comment.bo;

import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;


@SpringBootTest // spring 수행. 
class LiveCommentBOTest {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	
	@Autowired
	LiveCommentBO liveCommentBO;
	
	
	
	//@Transactional
	//@Test
	void 댓글쓰기() {
		logger.info("####### 댓글 쓰기 ######");
		liveCommentBO.addLiveComment(2, 2, "content");
	}
	
	
	//@Transactional
	//@Test
	void 댓글삭제() {
		logger.info("####### 댓글 삭제");
		liveCommentBO.deleteLiveComment(3);
	}
	
	
	
	
	//@Test
	void test() {
		fail("Not yet implemented");
	}

}
