package com.language.live.bo;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.language.live.model.LiveView;


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
	
	
	
	
	
	//@Transactional
	//@Test
	void 라이브View_가져오기() {
		logger.info("###### 라이브 View 정보들 가져오기");
		List<LiveView> liveViewList = liveBO.generateCardList("EN");
		assertNotNull(liveViewList);
	}
	
	
	
	//@Test
	void test() {
		fail("Not yet implemented");
	}

}
