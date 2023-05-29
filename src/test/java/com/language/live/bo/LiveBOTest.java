package com.language.live.bo;

import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;


@SpringBootTest   // spring 수행. 있어야만 수행됨.
class LiveBOTest {

	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	LiveBO liveBO;
	
	
	
	//@Transactional  // insert 후 다시 rollback   // db에는 안쌓이고 에러 나는지만 체크해줌.
	//@Test
//	void 라이브글쓰기() {
//		logger.info("###### 라이브 글쓰기");
//		liveBO.addLive(3, "content", "file");
//	}
	
	
	
	
	
	
	//@Test
	void test() {
		fail("Not yet implemented");
	}

}
