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

import com.language.live.model.Live;
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
		List<LiveView> liveViewList = liveBO.generateCardList("EN",4);
		assertNotNull(liveViewList);
	}
	
	
	
	
	//@Transactional
	//@Test
	void 라이브리스트가져오기ByLanguage() {
		logger.info("####### 라이브 글 리스트 가져오기 by Language");
		List<Live> live = liveBO.getLiveListByLanguage("EN");
		assertNotNull(live);
	}
	
	
	
	//@Transactional
	//@Test
	void 라이브가져오기ByLiveIdUserId() {
		logger.info("####### 라이브 글 가져오기 by LiveId UserId");
		Live live = liveBO.getLiveByLiveIdUserId(5, 9);  // 실제 db에 있는 id, userId 번호를 써야 됨.
		assertNotNull(live);
	}
	
	
	
	
	//@Transactional
	//@Test
	void 라이브_글_삭제 () {
		logger.info("######## 라이브 글 삭제 ");
		int liveDelete = liveBO.deleteLiveByLiveIdUserId(3, 3);
		assertNotNull(liveDelete);
	}
	
	
	//@Test
	void test() {
		fail("Not yet implemented");
	}

}
